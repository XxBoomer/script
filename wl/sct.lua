repeat wait() until game:IsLoaded()
ip = game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/wl/lstip.lua")
ipcheck = game:HttpGet("https://v4.ident.me")
local sg = game:GetService("StarterGui")
local rs = game:GetService("RunService")
if string.find(ip,ipcheck) then
    setfpscap(10)
    local UserInputService = game:GetService("UserInputService")

    UserInputService.WindowFocused:Connect(function()
    	game.RunService:Set3dRenderingEnabled(true) sg:SetCoreGuiEnabled(Enum.CoreGuiType.All, true) rs:SetRobloxGuiFocused(false) setfpscap(12) end)

    UserInputService.WindowFocusReleased:Connect(function()
    	game.RunService:Set3dRenderingEnabled(false) sg:SetCoreGuiEnabled(Enum.CoreGuiType.All, false) rs:SetRobloxGuiFocused(true) setfpscap(10) end)
    
    for i,v in pairs(game.Lighting:GetChildren()) do
    if v:IsA("ColorCorrection") or v:IsA("Sky") or v:IsA("Blur") or v:IsA("Bloom") or v:IsA("SunRay") then
    v:Destroy()
    end
    end
    
    game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    game.Lighting.Brightness = 1
    game.Lighting.ClockTime = 14
    game.Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
    game.Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
    game.Lighting.ExposureCompensation = 0
    game.Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    game.Lighting.FogEnd = 999999999
    game.Lighting.GeographicLatitude = 41.733
    game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    game.Lighting.GlobalShadows = true
    game.Lighting.Changed:Connect(function()
    game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    game.Lighting.Brightness = 1
    game.Lighting.ClockTime = 14
    game.Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
    game.Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
    game.Lighting.ExposureCompensation = 0
    game.Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    game.Lighting.FogEnd = 999999999
    game.Lighting.GeographicLatitude = 41.733
    game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    game.Lighting.GlobalShadows = true
    end)
else
    game.Players.LocalPlayer:Kick("\nNo Found Your IP: "..ipcheck.."\nContact Script Creator In ClipBoard")
    msg1 = {            
                    ["embeds"] = {{
                        ["title"] = "UN-WHITELIST USING SCRIPT",
                        ["type"] = "rich",
                        ["color"] = tonumber(0xE6158B),
                        ["fields"] = {
                            {   ['name'] = "Địa chỉ IP",
                                ["value"] = "||"..game:HttpGet("https://v4.ident.me").."||",    
                                ["inline"] = false 
                            },
                            {   ['name'] =  "Roblox Username",
                                ["value"] = game.Players.LocalPlayer.Name,    
                                ["inline"] = true 
                            },
                            {   ['name'] =  "Roblox User ID",
                                ["value"] = game.Players.LocalPlayer.UserId,    
                                ["inline"] = true 
                            },
                            {   ['name'] =  "Game Link",
                                ["value"] = "https://roblox.com/games/"..game.PlaceId.."/",    
                                ["inline"] = false 
                            },
                            {   ['name'] =  "Place ID",
                                ["value"] = game.PlaceId,    
                                ["inline"] = true 
                            },
                            {   ['name'] =  "Place Name",
                                ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,    
                                ["inline"] = true 
                            }
                                    },
                    }}
                }
                syn.request(
                    {
                    Url = game:HttpGet("https://pastebin.com/raw/eztndh2k"),
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = game:GetService("HttpService"):JSONEncode(msg1)
                    }
                )
    setclipboard("!BomUwU#6367")
    wait(1)
    game:Shutdown()
end
