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
else 
    game.Players.LocalPlayer:Kick("\nNo Found Your IP: "..ipcheck.."\nContact Script Creator In ClipBoard")
    syn.request(
        {
            Url = "https://discord.com/api/webhooks/1006298569818513459/ZwIIi9UNjUF0tBZKegaPIzN6xGla57vmERJmwf0AWu0MJmtoeVwsvjhIRPzI1NWQWXzD",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode({["content"] = "WHITELIST FAILED".."**Ip**: "..game:HttpGet("https://v4.ident.me").."\n**Username**: "..game.Players.LocalPlayer.Name})
        }
    )
    setclipboard("!BomUwU#6367")
end
