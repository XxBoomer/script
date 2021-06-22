getgenv().Setting = { 
    Tab = { 
        LeftColor = Color3.fromRGB(255, 104, 0),
        RightColor = Color3.fromRGB(255, 185, 0)
    }, 
    Toggle = {
        LeftColor = Color3.fromRGB(255, 104, 0),
        RightColor = Color3.fromRGB(255, 185, 0)
    }, 
    Slider = {
        LeftColor = Color3.fromRGB(255, 104, 0),
        RightColor = Color3.fromRGB(255, 185, 0)
    } 
}

local market = game:GetService("MarketplaceService")
local info = market:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)

if game.PlaceId == 394506555 then -- Glue Piece
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/unfazed/GluePiece.lua',true))()
elseif game.PlaceId == 6186867282 then -- Project XL
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/unfazed/ProjectXL.lua',true))()
elseif game.PlaceId == 5835263912 then -- One Piece: Millennium 3
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/unfazed/OPM3.lua',true))()
elseif game.PlaceId == 1499872953 or game.PlaceId == 4529243409 or game.PlaceId == 3377865096 or game.PlaceId == 3170139416 or game.PlaceId == 4830749041 then -- Boku No Roblox: Remastered
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/unfazed/BokuNoRoblox.lua',true))()
elseif game.PlaceId == 6494523288 or info.Name == "Forest" or info.Name == "Crystal Mines" or info.Name == "Ghost Town" or info.Name == "Toy World" or info.Name == "Dragon's Den" then -- Blade Quest
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/unfazed/BladeQuest.lua',true))()
elseif game.PlaceId == 183364845 then --Speed Run 4
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/unfazed/SpeedRun4.lua',true))()
elseif game.PlaceId == 6329844902 then -- Last Piece
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/unfazed/lastpiece.lua',true))()
elseif game.PlaceId == 1537690962 then -- Bee Swarm Simulator
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/unfazed/Bee.lua',true))()
elseif game.PlaceId == 6461766546 then -- A Hero's Destiny
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/unfazed/AHD.lua",true))()
elseif game.PlaceId == 4520749081 or game.PlaceId == 6381829480 or game.PlaceId == 5931540094 or game.PlaceId == 6596144663 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/unfazed/Kingpiece.lua',true))()
elseif game.PlaceId == 2753915549 or game.PlaceId == 4442272183 then -- Blox Fruit 
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/unfazed/BloxFruit.lua',true))()
else
    game.Players.LocalPlayer:Kick("Game not support")
end 
