repeat wait() until game:IsLoaded()
ip = game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/wl/lstip.lua")
ipcheck = game:HttpGet("https://v4.ident.me")
if string.find(ip,ipcheck) then
    setfpscap(30)
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
    local UserInputService = game:GetService("UserInputService")

    UserInputService.WindowFocused:Connect(function()
    	game.RunService:Set3dRenderingEnabled(true) setfpscap(30) end)

    UserInputService.WindowFocusReleased:Connect(function()
    	game.RunService:Set3dRenderingEnabled(false) setfpscap(25) end)
else 
    game.Players.LocalPlayer:Kick("\nNo Found Your IP: "..ipcheck.."\nContact Script Creator In ClipBoard")
    setclipboard("!BomUwU#6367")
end
