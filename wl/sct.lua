repeat wait() until game:IsLoaded()
ip = game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/wl/lstip.lua")
ipcheck = game:HttpGet("https://v4.ident.me")
if string.find(ip,ipcheck) then
    setfpscap(30)
    local UserInputService = game:GetService("UserInputService")

    UserInputService.WindowFocused:Connect(function()
    	game.RunService:Set3dRenderingEnabled(true) setfpscap(30) end)

    UserInputService.WindowFocusReleased:Connect(function()
    	game.RunService:Set3dRenderingEnabled(false) setfpscap(25) end)
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/wl/deletesky.lua")
else 
    game.Players.LocalPlayer:Kick("\nNo Found Your IP: "..ipcheck.."\nContact Script Creator In ClipBoard")
    setclipboard("!BomUwU#6367")
end
