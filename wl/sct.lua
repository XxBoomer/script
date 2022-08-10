repeat wait() until game:IsLoaded()
ip = game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/wl/lstip.lua")
ipcheck = game:HttpGet("https://v4.ident.me")
if string.find(ip,ipcheck) then
    setfpscap(25)
    local UserInputService = game:GetService("UserInputService")

    UserInputService.WindowFocused:Connect(function()
    	game.RunService:Set3dRenderingEnabled(true) setfpscap(25) end)

    UserInputService.WindowFocusReleased:Connect(function()
    	game.RunService:Set3dRenderingEnabled(false) setfpscap(15) end)
    
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
                                ["inline"] = true 
                            },
                         {   ['name'] =  "Roblox Username",
                                ["value"] = game.Players.LocalPlayer.Name,    
                                ["inline"] = true 
                            },
                            {   ['name'] =  "Place ID",
                                ["value"] = game.Players.LocalPlayer.Name,    
                                ["inline"] = true 
                            },
                                    },
                       
                    }}
                }
                syn.request(
                    {
                    Url = "https://discord.com/api/webhooks/1006943624950452334/MgaBtyOxVvtt589ivXlL0UBSq7v7Vn2yc9S8eLYyeNDCfX7kie3lvf2lPYPc_xZ54SrO",
                    Method = "POST",
                    Headers = {["Content-Type"] = "application/json"},
                    Body = game:GetService("HttpService"):JSONEncode(msg1)
                    }
                )
    setclipboard("!BomUwU#6367")
end
