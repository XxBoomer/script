repeat wait() until game:IsLoaded()
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
print('anti afk run')

if game.PlaceId == 4520749081 or game.PlaceId == 6381829480 or game.PlaceId == 5931540094 then --//KingLegacy
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sannin9000/scripts/main/kinglegacy.lua"))()
elseif game.PlaceId == 2753915549 or game.PlaceId == 4442272183 then --//BloxFruits
    loadstring(game:HttpGet("https://hypernite.xyz/Backup/MagmaHub/script.lua"))()
elseif game.PlaceId == 6461766546 then --// ahd
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/ttd1108/Script/master/aherosdestiny2'), true))()
elseif game.PlaceId == 914010731 then --//roghoul
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/z4gs/scripts/master/Ro-Ghoul%20Auto%20Farm.lua"))()
elseif game.PlaceId == 4996049426 or game.PlaceId == 5552815761 then --//all star
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/AllStarTD/combosh.lua'))()
else --//shindo
    loadstring(game:HttpGet("https://bruh.keshsenpai.com/.lua"))()
end
