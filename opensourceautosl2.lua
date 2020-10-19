--[[
GAME LINK https://www.roblox.com/games/4616652839/TEN-TAILS-Shinobi-Life-2
v3rm: https://v3rmillion.net/showthread.php?tid=1063031
Discord: reav#2966
Discord Server: https://discord.gg/DqZVPH
Usage:
_G.speed = 750
loadstring(game:HttpGet("https://raw.githubusercontent.com/reavscripts/sl2_autofarm/main/main.lua", true))()
]]

repeat wait() until game:IsLoaded()
--antitp bypass
if workspace:FindFirstChild("CCoff") then
    game:GetService("Workspace").CCoff:Destroy()
end
--antiafk
local VirtualUser=game:service'VirtualUser'
	game:service'Players'.LocalPlayer.Idled:connect(function()
	print("reav")
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)
--variables
local player = game.Players.LocalPlayer
local mission = player.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory")
function toTarget(pos, targetPos, targetCFrame)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/_G.speed, Enum.EasingStyle.Linear)
    local tween, err = pcall(function()
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(90))})
        tween:Play()
    end)
    if not tween then return err end
end

local mouse = game.Players.LocalPlayer:GetMouse()
--loading wally ui revamped By Aika
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Shinobi Life 2")
local b = w:CreateFolder("AutoFarm")

local autofarm
b:Toggle("Autofarm",function(bool)
    autofarm = bool
end)
local scrollfarm
b:Toggle("Scroll Sniper",function(bool)
    scrollfarm = bool
end)
local jinfarm
b:Toggle("Jin Farm",function(bool)
    jinfarm = bool
end)
--local rankup
--b:Toggle("AutoRank",function()
--    rankup = bool
--end)
local c = w:CreateFolder("War Farm")
local war 
c:Toggle("WarMode + Snipe",function(bool)
    war = bool
end)
local reset
c:Toggle("Reset after round 21",function(bool)
    reset = bool
end)
--Suggested by Moddi#2715
local refresh = c:Label("ROUND COUNTER",{
    TextSize = 24;
    TextColor = Color3.fromRGB(205, 221, 221); 
    BgColor = Color3.fromRGB(5, 16, 20);
}) 

local d = w:CreateFolder("Quests Maker")
d:Button("Rushs",function()
    for i = 1,300 do
        game.Players.LocalPlayer.Character.combat.update:FireServer("rushw")
        wait(.25)
    end
end)
d:Button("Jumps",function()
    for v = 1,300 do
        game.Players.LocalPlayer.Character.combat.update:FireServer("takemovement2")
        wait(.25)
    end
end)
d:Button("Chakra Charges",function()
    for i = 1,500 do
        game.Players.LocalPlayer.Character.combat.update:FireServer("key","c")
        wait(.1)
        game.Players.LocalPlayer.Character.combat.update:FireServer("key","cend")
        wait(.5)
    end
end)
d:Button("Punches",function()
    for i = 1,999 do
        game.Players.LocalPlayer.Character.combat.update:FireServer("mouse1",true)
        wait(.3)
    end
end)
d:Button("TP TrainLog",function()
    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").npclogtraining:FindFirstChild("HumanoidRootPart").Position,CFrame.new(game:GetService("Workspace").npclogtraining:FindFirstChild("HumanoidRootPart").Position))
end)
local e = w:CreateFolder("Misc")
e:Label("made by reav#2966 | ver 1.7",{
    TextSize = 17;
    TextColor = Color3.fromRGB(205, 221, 221); 
    BgColor = Color3.fromRGB(5, 16, 20);
    
}) 
e:Label("Discord: ",{
    TextSize = 24;
    TextColor = Color3.fromRGB(205, 221, 221); 
    BgColor = Color3.fromRGB(5, 16, 20);
    
}) 
e:Label("https://discord.gg/aDRStgw",{
    TextSize = 17;
    TextColor = Color3.fromRGB(205, 221, 221); 
    BgColor = Color3.fromRGB(5, 16, 20);
    
}) 
game:GetService('RunService').Stepped:connect(function()
	if autofarm then
	    pcall(function()
    	    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end)
    end
end)

spawn(function()
    while wait() do
        if autofarm then
            if mission.Visible == false then
                for i,v in pairs(workspace.missiongivers:GetChildren()) do
                    if v.Name == "" and v:FindFirstChild("Head") then
                        local TALK = v:FindFirstChild("Talk")
                        --local mob = TALK:WaitForChild("mobname").Value
                        local lvl = player.statz.lvl.lvl.Value
                        if lvl < 700 then
                            if v.Head.givemission.Enabled == true and v.Head.givemission.color.Image == "http://www.roblox.com/asset/?id=5459241648" and not mission.Visible then
                                pcall(function()
                                    if TALK:WaitForChild("mobname") then
                                        local getmission = v:FindFirstChild("HumanoidRootPart")
                                        local clienttalk = v:FindFirstChild("CLIENTTALK")
                                        repeat wait()
                                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-10,0)))
                                            wait(1)
                                            clienttalk:FireServer()
                                            clienttalk:FireServer("accept")
                                        until mission.Visible or not autofarm or not v.Head.givemission.Enabled == false
                                    end
                                end)
                            end
                        elseif lvl >= 700 then
                            if v.Head.givemission.Enabled == true and v.Head.givemission.color.Image == "http://www.roblox.com/asset/?id=5459241648" or v.Head.givemission.color.Image == "http://www.roblox.com/asset/?id=5459241799" and not mission.Visible then
                                pcall(function()
                                    if TALK:WaitForChild("mobname") then
                                        local getmission = v:FindFirstChild("HumanoidRootPart")
                                        local clienttalk = v:FindFirstChild("CLIENTTALK")
                                        repeat wait()
                                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-10,0)))
                                            wait(1)
                                            clienttalk:FireServer()
                                            clienttalk:FireServer("accept")
                                        until mission.Visible or not autofarm or v.Head.givemission.Enabled == false
                                    end
                                end)
                            end
                        end
                    end
                end
            else
                for i,v in pairs(workspace.npc:GetChildren()) do
                    if v.ClassName == "Model" and v:FindFirstChild("npctype") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 then
                        repeat wait()
                            pcall(function()
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-10,0)))
                                wait(.25)
                                v.Humanoid.Health = 0
                            end)
                        until v.Humanoid.Health == 0 or mission.Visible == false or not v or not autofarm
                    end
                end
            end
        end
    end
end)
local function SCROLLFARM()
    for i,v in pairs(game.workspace.GLOBALTIME:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 then
		    warn("SCROLL SPAWNED")
            pcall(function()
                toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
            end)
            fireclickdetector(v.sh.ClickDetector)
	    	warn("SCOLL TAKEN")
        end
    end
end
spawn(function()
    while wait() do
        if scrollfarm or war then
            SCROLLFARM()
        end
    end
end)
local function JINFARM()
    for i,v in pairs(game.workspace.GLOBALTIME:GetChildren()) do
        if v.ClassName == "Model" and string.find(v.Name, "npc1") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid").Health < 0 then
            repeat wait()
                pcall(function()
                	wait(.5)
                	toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.Head.Position,CFrame.new(v.Head.Position))
			        wait(.5)
			        toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position))
                end)
                if (player.Character.Head.Position-v.HumanoidRootPart.Position).Magnitude < 50 then 
                    v.Humanoid.Health = 0
                end
            until v.Humanoid.Health == 0 or not v
        end
    end
end
spawn(function()
    while wait() do
        if jinfarm then
            JINFARM()
        end
    end
end)
spawn(function()
    while wait() do
        if rankup then
            player.Character.startevent:FireServer("rankup")
        end
    end
end)
spawn(function()
    while wait() do
        if war then
            refresh:Refresh("Round: " .. workspace.warserver.round.Value)
            for i,v in pairs(workspace.npc:GetChildren()) do
                if v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and not v:FindFirstChild("megaboss") then
                    wait(.1)
                    pcall(function()
		            	v.Humanoid.Health = 0
                    end)
                elseif v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and v:FindFirstChild("megaboss") then
                    pcall(function()
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position))
                        wait(3)
                        v.Humanoid.Health = 0
                    end)
                end
            end
            if reset then
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == "warserver" and v:FindFirstChild("round").Value > 20 then
            			repeat wait()
            			until v.round.Value == 0
                    end
                end
            end
        end
    end
end)
