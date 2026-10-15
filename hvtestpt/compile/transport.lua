-- Firebase RTDB REST transport for the existing HarvardPartyRelay protocol.
-- Participants are trusted: party access permits editing the whole shared party.
return function(settings, deps)
    deps = deps or {}
    local json = deps.json or game:GetService("HttpService")
    local http = deps.request or (syn and syn.request) or (http and http.request) or http_request or request
    local clock = deps.clock or os.clock
    local pause = deps.wait or task.wait
    local base = tostring(settings.databaseUrl or ""):gsub("/+$", "")
    local key = tostring(settings.apiKey or "")
    local token, refresh, expires, uid, sampled, sampledAt
    local function fail(code, message, snapshot)
        error({code = code, message = message, snapshot = snapshot}, 0)
    end
    local function copy(value)
        return json:JSONDecode(json:JSONEncode(value))
    end
    local function send(method, url, body, headers)
        if type(http) ~= "function" then fail(503, "Executor has no HTTP request function") end
        local ok, response = pcall(http, {Url = url, Method = method, Body = body,
            Headers = headers or { ["Content-Type"] = "application/json" }, Timeout = 8})
        if not ok or type(response) ~= "table" then fail(503, "Firebase network request failed") end
        local status = tonumber(response.StatusCode or response.status_code) or 0
        local decoded
        local valid, value = pcall(function() return json:JSONDecode(response.Body or response.body or "null") end)
        if valid then decoded = value end
        return status, decoded, response.Headers or response.headers or {}
    end
    local function authenticate(force)
        if not force and token and clock() < expires then return end
        local status, body
        if refresh then
            status, body = send("POST", "https://securetoken.googleapis.com/v1/token?key=" .. key,
                "grant_type=refresh_token&refresh_token=" .. json:UrlEncode(refresh),
                {["Content-Type"] = "application/x-www-form-urlencoded"})
            if status == 200 and type(body) == "table" then
                token, refresh, uid = body.id_token, body.refresh_token, body.user_id
            else
                refresh = nil
            end
        end
        if not refresh then
            status, body = send("POST", "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" .. key,
                json:JSONEncode({email = settings.email, password = settings.password, returnSecureToken = true}))
            if status ~= 200 or type(body) ~= "table" then
                fail(401, "Firebase sign-in failed; check Email/Password provider, API key and test login")
            end
            token, refresh, uid = body.idToken, body.refreshToken, body.localId
        end
        if type(token) ~= "string" or type(refresh) ~= "string" or type(uid) ~= "string" then
            fail(401, "Firebase returned an invalid sign-in response")
        end
        expires = clock() + math.max(1, (tonumber(body.expiresIn or body.expires_in) or 3600) - 120)
    end
    local function db(method, path, value, headers)
        authenticate(false)
        local encoded = value ~= nil and json:JSONEncode(value) or nil
        local function invoke()
            return send(method, base .. path .. ".json?auth=" .. json:UrlEncode(token), encoded, headers)
        end
        local code, result, resultHeaders = invoke()
        if code == 401 then
            authenticate(true)
            code, result, resultHeaders = invoke()
        end
        if code == 401 or code == 403 then
            fail(403, "Firebase denied access; check Rules and partyAccess for this Auth UID")
        end
        return code, result, resultHeaders
    end
    local function serverClock()
        if not sampled or clock() - sampledAt >= 30 then
            authenticate(false)
            local code, value = db("PUT", "/clock/" .. uid, {[".sv"] = "timestamp"})
            if code ~= 200 or type(value) ~= "number" then fail(503, "Firebase server clock unavailable") end
            sampled, sampledAt = value, clock()
        end
        return sampled + (clock() - sampledAt) * 1000
    end
    local function positive(n) return type(n) == "number" and n > 0 and n % 1 == 0 end
    local function username(n)
        return type(n) == "string" and #n >= 3 and #n <= 20 and n:match("^[%w_]+$")
    end
    local function config(input, id)
        if type(input) ~= "table" or type(input.accounts) ~= "table"
            or #input.accounts < 1 or #input.accounts > 64 then fail(400, "Party needs 1-64 accounts") end
        local result, names, fighter = copy(input), {}, false
        for _, account in ipairs(result.accounts) do
            if type(account) ~= "table" or not username(account.name) then fail(400, "Invalid Roblox username") end
            local name = account.name:lower()
            if names[name] then fail(400, "Duplicate account") end
            names[name] = true
            if not ({leader=true, fight=true, carry=true, leech=true})[account.role] then fail(400, "Invalid account role") end
            account.enabled = account.enabled ~= false
            fighter = fighter or (account.enabled and account.role ~= "leech")
        end
        if not fighter then fail(400, "Party needs an enabled fighter") end
        result.id, result.v, result.on = id, 2, input.on == true
        return result
    end
    local function roster(party, name)
        for _, a in ipairs(party.config.accounts) do
            if a.name:lower() == name then return a end
        end
    end
    local function eligible(party, account, now)
        local m = party.members[account.name:lower()]
        if not m or now - m.seen >= 30000 or not account.enabled or account.role == "leech" then return false end
        local s = m.state
        return s.level > 0 and s.job ~= "" and s.placeId > 0 and s.place ~= "?"
            and not s.loading and not s.setup and not s.dropPending
            and not (s.place ~= "Lobby" and s.spectator)
            and not (s.resting and s.resting > now / 1000)
            and not (s.stuck and now / 1000 - s.stuck <= 120)
    end
    local function elect(party, now)
        local current = party.leader and roster(party, party.leader)
        if party.config.on and current and party.leaseUntil > now and eligible(party, current, now) then return end
        local chosen
        if party.config.on then
            for _, a in ipairs(party.config.accounts) do
                if a.enabled and a.role == "leader" then
                    if eligible(party, a, now) then chosen = a end
                    break
                end
            end
            if not chosen and (party.leader or now - party.created >= 10000) then
                for _, a in ipairs(party.config.accounts) do
                    if eligible(party, a, now) then chosen = a; break end
                end
            end
        end
        local nextName = chosen and chosen.name:lower() or nil
        if nextName ~= party.leader then party.epoch += 1 end
        party.leader = nextName
        party.leaseUntil = chosen and party.members[nextName].seen + 30000 or 0
    end
    local function snapshot(party, now)
        local presence = {}
        for _, a in ipairs(party.config.accounts) do
            local name = a.name:lower()
            local m = party.members and party.members[name]
            if a.enabled and m and now - m.seen < 30000 then
                presence[name] = copy(m.state)
                presence[name].at = math.floor(m.seen / 1000)
            end
        end
        return {config = party.config, revision = party.revision, presence = presence,
            leader = party.leader, epoch = party.epoch, leaseUntil = party.leaseUntil,
            serverNow = now, leaseMs = 30000}
    end
    local function state(input, identity, now)
        if type(input) ~= "table" or not ({Lobby=true, Level=true, ["100+"]=true, ["?"]=true})[input.place] then
            fail(400, "Invalid place state")
        end
        local s = {name=identity.name, userId=identity.userId, place=input.place,
            placeId=positive(input.placeId) and input.placeId or 0,
            job=type(input.job) == "string" and #input.job <= 160 and input.job or "",
            level=type(input.level) == "number" and math.max(0, math.floor(input.level)) or 0}
        for _, k in ipairs({"loading", "setup", "over", "owner", "noFreeSlot", "dropPending", "spectator"}) do
            if type(input[k]) == "boolean" then s[k] = input[k] end
        end
        for _, k in ipairs({"slot", "xpBoost", "restBreak", "rosterRevision"}) do
            if type(input[k]) == "number" and input[k] >= 0 then s[k] = input[k] end
        end
        for _, k in ipairs({"lastRun", "hop"}) do
            if type(input[k]) == "string" and #input[k] <= 160 then s[k] = input[k] end
        end
        if type(input.restingFor) == "number" and input.restingFor > 0 then s.resting = now / 1000 + math.min(input.restingFor, 86400) end
        if type(input.stuckAge) == "number" and input.stuckAge >= 0 then s.stuck = now / 1000 - math.min(input.stuckAge, 86400) end
        return s
    end
    local function sync(body)
        if not base:match("^https://[%w-]+%.firebaseio%.com$")
            and not base:match("^https://[%w.-]+%.firebasedatabase%.app$") then
            fail(400, "Fill databaseUrl with your Firebase Realtime Database HTTPS URL")
        end
        if key == "" or type(settings.email) ~= "string" or settings.email == ""
            or type(settings.password) ~= "string" or settings.password == "" then
            fail(400, "Fill apiKey, email and password in the Firebase settings header")
        end
        local id = body.partyId
        if type(id) ~= "string" or #id < 1 or #id > 64 or not id:match("^[%w_-]+$") then fail(400, "Invalid partyId") end
        if not username(body.name) or not positive(body.userId) or not positive(body.universeId)
            or type(body.sessionId) ~= "string" or #body.sessionId < 8 or #body.sessionId > 100
            or not body.sessionId:match("^[%w_-]+$") then fail(400, "Invalid member identity") end
        local name = body.name:lower()
        for attempt = 1, 5 do
            local now = serverClock()
            local code, party, headers = db("GET", "/parties/" .. id, nil, {["X-Firebase-ETag"] = "true"})
            if code ~= 200 then fail(503, "Firebase party read failed") end
            local etag
            for k, v in pairs(headers) do if tostring(k):lower() == "etag" then etag = v end end
            if type(etag) ~= "string" or etag == "" then fail(503, "Executor hides ETag headers; atomic Firebase sync unavailable") end
            -- A read may have been committed after our cached clock sample.
            if type(party) == "table" and type(party.serverNow) == "number" and party.serverNow > now then
                sampled, sampledAt, now = party.serverNow, clock(), party.serverNow
            end
            if party == nil then
                if not body.seed then fail(404, "Party not published yet; configure and publish from main") end
                party = {schemaVersion=1, config=config(body.seed, id), revision=1, universeId=body.universeId,
                    members={}, epoch=0, leaseUntil=0, created=now}
                local publisher = roster(party, name)
                if not publisher or not publisher.enabled then fail(403, "Publisher not in enabled roster") end
            end
            if party.schemaVersion ~= 1 or type(party.config) ~= "table" then fail(409, "Unsupported Firebase party schema") end
            party.members = party.members or {}
            if party.universeId ~= body.universeId then fail(409, "Party belongs to another Roblox universe") end
            if not roster(party, name) then
                if settings.autoRegisterLeech ~= true or body.config then fail(403, "Account not in party roster") end
                if #party.config.accounts >= 64 then fail(409, "Party roster is full (64 accounts)") end
                -- Append only this authenticated client's reported Roblox account as a Leech.
                -- ETag retries re-read the roster, preserving concurrent registrations/edits.
                party.config.accounts[#party.config.accounts + 1] = {name=body.name,role="leech",enabled=true}
                party.revision += 1
            end
            local previous = party.members[name]
            if previous and now - previous.seen < 30000
                and (previous.sessionId ~= body.sessionId or previous.state.userId ~= body.userId) then
                fail(409, "Another live script uses this account; wait 30 seconds after stopping it")
            end
            if body.config then
                if body.revision ~= party.revision then
                    fail(409, "Party changed elsewhere; refreshed config, retry your edit", snapshot(party, now))
                end
                party.config, party.revision = config(body.config, id), party.revision + 1
            end
            party.members[name] = {sessionId=body.sessionId, state=state(body.state, body, now), seen=now}
            for n, m in pairs(party.members) do
                if not roster(party, n) or now - m.seen > 90000 then party.members[n] = nil end
            end
            if party.leader == name then party.leaseUntil = now + 30000 end
            elect(party, now)
            party.serverNow = {[".sv"]="timestamp"}
            if party.members[name] then party.members[name].seen = {[".sv"]="timestamp"} end
            code, party = db("PUT", "/parties/" .. id, party,
                {["Content-Type"]="application/json", ["if-match"]=etag})
            if code == 200 and type(party) == "table" and type(party.serverNow) == "number" then
                sampled, sampledAt = party.serverNow, clock()
                return snapshot(party, party.serverNow)
            end
            if code ~= 412 then fail(503, "Firebase party write failed; config not confirmed") end
            if attempt < 5 then pause(0.05 * attempt + math.random() * 0.1) end
        end
        fail(503, "Firebase busy after conditional-write retries; waiting for next sync")
    end
    return function(requestOptions)
        local ok, result = pcall(function() return sync(json:JSONDecode(requestOptions.Body)) end)
        if ok then return {StatusCode=200, Body=json:JSONEncode(result)} end
        if type(result) == "table" and result.code then
            return {StatusCode=result.code, Body=json:JSONEncode({error=result.message, snapshot=result.snapshot})}
        end
        -- Never forward raw HTTP errors, which may contain auth URLs or credentials.
        return {StatusCode=503, Body=json:JSONEncode({error="Firebase transport error; check configuration and Rules"})}
    end
end
