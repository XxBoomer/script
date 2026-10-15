-- Public bootstrap. No Firebase credentials belong in this file.
-- A PRIVATE local wrapper calls the returned function with its settings.
return function(settings, options, deps)
    options, deps = options or {}, deps or {}
    if type(settings) ~= "table" then error("Missing private Firebase settings", 0) end
    local base = tostring(options.baseUrl or ""):gsub("/+$", "")
    if not base:match("^https://raw%.githubusercontent%.com/[%w_.%-]+/[%w_.%-]+/[^%s?#]+$")
        or base:find("/YOUR_USER/", 1, true) then
        error("Set githubBaseUrl to your own GitHub raw repository URL", 0)
    end
    local compile = deps.compile or loadstring
    if type(compile) ~= "function" then error("Executor has no loadstring function", 0) end
    local function download(filename)
        if deps.fetch then return deps.fetch(base .. "/" .. filename) end
        local ok, result = pcall(function() return game:HttpGet(base .. "/" .. filename) end)
        if not ok or type(result) ~= "string" or result == "" then
            error("Cannot download GitHub file: " .. filename, 0)
        end
        return result
    end
    local function chunk(filename)
        local fn = compile(download(filename), "HarvardGitHub/" .. filename)
        if type(fn) ~= "function" then error("Cannot compile GitHub file: " .. filename, 0) end
        return fn
    end
    -- Download/compile both before changing shared connection settings.
    local adapterChunk = chunk("transport.lua")
    local scriptChunk = chunk("havard.lua")
    local factory = adapterChunk()
    if type(factory) ~= "function" then error("Invalid Firebase adapter module", 0) end
    local transport = factory(settings)
    if type(transport) ~= "function" then error("Invalid Firebase transport", 0) end
    local relayOptions = {enabled = true, partyId = settings.partyId,
        publish = options.publish == true, request = transport,
        firebaseSettings = settings, requireRosterAck = settings.autoRegisterLeech == true}
    local globals = deps.globals or _G
    local getEnvironment = deps.getenv or getgenv
    globals.HarvardPartyRelay = relayOptions
    if type(getEnvironment) == "function" then
        getEnvironment().HarvardPartyRelay = relayOptions
    end
    return scriptChunk()
end
