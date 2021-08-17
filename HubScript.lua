repeat wait() until game:IsLoaded()
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
print('anti afk run')

if game.PlaceId == 4520749081 or game.PlaceId == 6381829480 or game.PlaceId == 5931540094 then --//KingLegacy
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/mainking.lua"))()
elseif game.PlaceId == 2753915549 or game.PlaceId == 4442272183 then --//BloxFruits
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/mainblox.lua"))()
elseif game.PlaceId == 6461766546 then --// ahd
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/ttd1108/Script/master/aherosdestiny2'), true))()
elseif game.PlaceId == 914010731 then --//roghoul
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/z4gs/scripts/master/Ro-Ghoul%20Auto%20Farm.lua"))()
elseif game.PlaceId == 4996049426 or game.PlaceId == 5552815761 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/AllStarTD/combosh.lua'))()
elseif game.PlaceId == 4616652839 or game.PlaceId == 4601350214 or game.PlaceId == 4601350809 or game.PlaceId == 4601350656 or game.PlaceId == 4601350760 or game.PlaceId == 4601350394 or game.PlaceId == 5447073001 or game.PlaceId == 5447073001 or game.PlaceId == 5084678830 or game.PlaceId == 5431071837 or game.PlaceId == 5431069982 or game.PlaceId == 6986372023 then
    loadstring(game:HttpGet("https://bruh.keshsenpai.com/.lua"))()
elseif game.PlaceId == 5824792748 then --//War Shindo
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/shinobilife2/warmode.lua"))()
elseif game.PlaceId == 6938803436 or game.PlaceId == 6990131029 then --//anime dimensions
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/ad/main.lua"))()
elseif game.PlaceId == 537413528 then --//build a boat for treasua
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/buildboat/auto.lua"))()
elseif game.PlaceId == 7177510595 or game.PlaceId == 7177496972 or game.PlaceId == 7177510595 or game.PlaceId == 7177510595 then --//anime warriors
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AltsegoD/scripts/egoD/AnimeWarriors.lua"))()
else
    print("")
end
