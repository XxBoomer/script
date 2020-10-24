--[[
GAME LINK https://www.roblox.com/games/4616652839/TEN-TAILS-Shinobi-Life-2
v3rm: https://v3rmillion.net/showthread.php?tid=1063031
Discord: reav#2966
Discord Server: https://discord.gg/aDRStgw
Usage:
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
	warn("anti-afk")
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
_G.ButtonColor = Color3.fromRGB(5, 16, 20);
_G.ButtonTextColor = Color3.fromRGB(205, 221, 221);
_G.PointerColor = Color3.fromRGB(255, 255, 255);
_G.SecondaryColor = Color3.fromRGB(0, 102, 255);
_G.TertiaryColor = Color3.fromRGB(5, 16, 20);
_G.ToggleColor = Color3.fromRGB(0, 255, 255);
_G.MainTextColor = Color3.fromRGB(255, 255, 255);
_G.MainColor = Color3.fromRGB(5, 16, 20);
_G.SliderColor = Color3.fromRGB(0, 102, 255);
 
local w = library:CreateWindow("Shinobi Life 2")
local b = w:CreateFolder("AutoFarm")

local autofarm
b:Toggle("Autofarm",function(bool)
    autofarm = bool
end)
_G.speed = 500
local speed
b:Slider("Tween Speed",{
    min = 250; 
    max = 800;
    precise = false;
},function(speed)
_G.speed = speed
end)
local scrollfarm
b:Toggle("Scroll Sniper",function(bool)
    scrollfarm = bool
end)
local jinfarm
b:Toggle("JinFarm (instakill)",function(bool)
    jinfarm = bool
end)
local RANKUP
b:Toggle("AutoRank",function(bool)
    RANKUP = bool
end)
local c = w:CreateFolder("War Farm")
c:Label("Snipe is built-in",{
    TextSize = 24;
    TextColor = Color3.fromRGB(205, 221, 221); 
    BgColor = Color3.fromRGB(5, 16, 20);
}) 
local war 
c:Toggle("WarMode No Tween",function(bool)
    war = bool
end)
local war2
c:Toggle("WarMode Tween (multple players)",function(bool)
    war2 = bool
end)

c:Slider("Tween Speed",{
    min = 250; 
    max = 800;
    precise = false;
},function(speed)
_G.speed = speed
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
local count = 0
local refreshC = c:Label("10TAILS COUNTER",{
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
    toTarget(player.Character.HumanoidRootPart.Position,workspace.npc.logtraining:FindFirstChild("HumanoidRootPart").Position,CFrame.new(game:GetService("Workspace").npc.logtraining:FindFirstChild("HumanoidRootPart").Position))
end)
local e = w:CreateFolder("Misc")
e:Box("Teleport to PS","string",function(tpps)
    game.Players.LocalPlayer.startevent:FireServer("teleporttoprivate", tpps)
end)
e:Label("made by reav#2966 | ver 2.7.2",{
    TextSize = 17;
    TextColor = Color3.fromRGB(205, 221, 221); 
    BgColor = Color3.fromRGB(5, 16, 20);
    
}) 
e:Label("https://discord.gg/aDRStgw",{
    TextSize = 17;
    TextColor = Color3.fromRGB(205, 221, 221); 
    BgColor = Color3.fromRGB(5, 16, 20);
    
}) 
e:Button("Copy Discord Link",function()
    setclipboard("https://discord.gg/aDRStgw")
end)
game:GetService('RunService').Stepped:connect(function()
	if autofarm or war2 then
	    pcall(function()
    	    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end)
    end
end)
local function npc()
    for i,v in pairs(workspace.npc:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChild("npctype") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 then
            pcall(function()    
                repeat wait()
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
                    v.Humanoid.Health = 0
                until v.Humanoid.Health == 0 or not autofarm
            end)
        end
    end
end
if not workspace:FindFirstChild("warmode") then
    if workspace.missiongivers:FindFirstChild("walls") then
        workspace.missiongivers:FindFirstChild("walls"):Destroy()
    end
    if workspace.missiongivers:FindFirstChild("NOMOVE") then
        workspace.missiongivers:FindFirstChild("NOMOVE"):Destroy()
    end
end
local function mission()
    for i,v in pairs(workspace.missiongivers:GetChildren()) do
        if v.Name == "" and v:FindFirstChild("Head") and player.currentmission.Value == nil and v.Head:WaitForChild("givemission").Enabled and v.Head.givemission:FindFirstChild("color").Visible and v:FindFirstChild("Talk") and v.Talk:FindFirstChild("typ").Value == "defeat" or v.Talk.typ.Value == "halloweenevent"  then
            local TALK = v:WaitForChild("Talk")
            local lvl = player.statz.lvl.lvl.Value
            if lvl <= 699 and TALK ~= nil then
                if player.currentmission.Value == nil and v.Head:FindFirstChild("givemission").Enabled and v.Head.givemission:FindFirstChild("color").Visible and v.Head.givemission.color.Image == "http://www.roblox.com/asset/?id=5459241648" and TALK and TALK:FindFirstChild("typ").Value == "defeat" or TALK.typ.Value == "halloweenevent" then
                    local clienttalk = v:FindFirstChild("CLIENTTALK")
                    --pcall(function()
                        repeat wait()
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-10,0)))
                            clienttalk:FireServer()
                            wait(.5)
                            clienttalk:FireServer("accept")
                        until v.Head.givemission.Enabled == false or player.currentmission.Value == "mission" or not autofarm
                    --end)
                end
            elseif lvl >= 700 and TALK ~= nil then
                if player.currentmission.Value == nil and v.Head:FindFirstChild("givemission").Enabled and v.Head.givemission:FindFirstChild("color").Visible and v.Head.givemission.color.Image == "http://www.roblox.com/asset/?id=5459241648" or v.Head.givemission.color.Image == "http://www.roblox.com/asset/?id=5459241799" and TALK and TALK:FindFirstChild("typ").Value == "defeat" or TALK.typ.Value == "halloweenevent" then
                    local clienttalk = v:FindFirstChild("CLIENTTALK")
                    --pcall(function()
                        repeat wait()
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-10,0)))
                            clienttalk:FireServer()
                            wait(.5)
                            clienttalk:FireServer("accept")
                        until v.Head.givemission.Enabled == false or player.currentmission.Value == "mission" or not autofarm
                    --end)
                end
            end
        end
    end
end
spawn(function()
    while wait() do
        if autofarm then
            if  player.currentmission.Value == nil then
                mission()
            else
                npc()
            end
        end
    end
end)

local function SCROLLFARM()
    for i,v in pairs(game.workspace.GLOBALTIME:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and v.sh.Position.Y < 2000 then
            local scrollA = v.sh:FindFirstChild("invoke")
            print("SCROLL SPAWNED")
            pcall(function()
                toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
			end)
            scrollA:FireServer(game.Players.LocalPlayer)
            fireclickdetector(v.sh.ClickDetector)
        end
    end
end
local function SCROLLFARM1()
    for i,v in pairs(game.workspace:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and v.sh.Position.Y < 2000 then
            local scrollA = v.sh:FindFirstChild("invoke")
            print("SCROLL SPAWNED in workspace")
            pcall(function()
                toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
                scrollA:FireServer(game.Players.LocalPlayer)
                fireclickdetector(v.sh.ClickDetector)
            end)
        end
    end
end
spawn(function()
    while wait() do
        if scrollfarm or war or war2 then
            repeat wait()
                SCROLLFARM()
                SCROLLFARM1()
            until not scrollfarm or not war or not war2
        end
    end
end)
local function JINFARM()
    for i,v in pairs(game:GetService("Workspace").npc:GetChildren()) do
        if v.Name == "npc1" then
            repeat wait()
                pcall(function()
			        toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position))
                	wait(.1)
		        	v.Humanoid.Health = 0
		        	toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-25,0)))
	        	    wait(.1)
	        	end)
            until v.Humanoid.Health == 0 or not jinfarm
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
        if RANKUP and player.statz.lvl:FindFirstChild("lvl").Value == 1000 then
            repeat wait()
                game.Players.LocalPlayer.startevent:FireServer("rankup")
            until player.statz.lvl:FindFirstChild("lvl").Value == 1 or not RANKUP
        end
    end
end)

spawn(function()
    while wait() do
        if war then
            pcall(function()
                refresh:Refresh("War Completed: " .. count)
                refreshC:Refresh("Round: " .. workspace.warserver.round.Value)
            end)
            for i,v in pairs(workspace.npc:GetChildren()) do
                if workspace.warserver:FindFirstChild("zetsu").Value > 0 and v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and not v:FindFirstChild("megaboss") then
                    wait(.1)
                    pcall(function()
	            	    v.Humanoid.Health = 0
                    end)
                elseif v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and v:FindFirstChild("megaboss") then
                    wait(6)
					pcall(function()
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position))
                        v.Humanoid.Health = 0
                    end)
                end
            end
            if reset then
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == "warserver" and v:FindFirstChild("round").Value > 20 then
            			wait(5)
            			player.Character:BreakJoints()
            			repeat wait()
            			until v.round.Value == 0
            			count = count + 1
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if war2 then
            refresh:Refresh("War Completed: " .. count)
            refreshC:Refresh("Round: " .. workspace.warserver.round.Value)
            for i,v in pairs(workspace.npc:GetChildren()) do
                if workspace.warserver:FindFirstChild("zetsu").Value > 0 and v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and not v:FindFirstChild("megaboss") then
                    pcall(function()
                        repeat wait()
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-5,0)))
		                wait(.3)
		                v.Humanoid.Health = 0
		                until v.Humanoid.Health == 0
                    end)
                elseif v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and v:FindFirstChild("megaboss") then
                    wait(6)
					pcall(function()
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-25,0)))
                        v.Humanoid.Health = 0
                    end)
                else
                    wait()
                end
            end
            if reset then
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == "warserver" and v:FindFirstChild("round").Value > 20 then
            			wait(5)
            			player.Character:BreakJoints()
            			repeat wait()
            			until v.round.Value == 0
            			count = count + 1
                    end
                end
            end
        end
    end
end)
