repeat wait() until game:IsLoaded()
ip = game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/wl/lstip.lua")
ipcheck = game:HttpGet("https://v4.ident.me")
if string.find(ip,ipcheck) then 
    setfpscap(40)
else 
    game.Players.LocalPlayer:Kick("Wrong Ip Address")
end
