lvlold = game:GetService("Players").LocalPlayer.Data.Level.Value
lvlnew = lvlold+300
repeat wait() until game:GetService("Players").LocalPlayer.Data.Level.Value >= lvlnew or game:GetService("Players").LocalPlayer.Data.Level.Value >= 700
game.Players.LocalPlayer:Kick("đã cày xong\nusername: "..game.Players.LocalPlayer.Name.."\nLvl Old: "..lvlold.."\nlvl stop: "..tostring(lvlnew))
