repeat wait() until game:IsLoaded()
ip = game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/wl/lstip.lua")
ipcheck = game:HttpGet("https://v4.ident.me")
if string.find(ip,ipcheck) then 
    setfpscap(38)
else 
    game.Players.LocalPlayer:Kick("\nNo Found Your IP: "..ipcheck.."\nContact Script Creator In ClipBoard")
    setclipboard("!BomUwU#6367")
end
