--[[
GAME LINK https://www.roblox.com/games/4616652839/TEN-TAILS-Shinobi-Life-2
Script from reavreav@v3rmillion.net 
reav#2966
_G.speed = 750
loadstring(game:HttpGet("https://raw.githubusercontent.com/reavscripts/sl2_autofarm/main/main.lua", true))()
]]

repeat wait() until game:IsLoaded()
--antitp bypass
if workspace:FindFirstChild("CCoff") then
    game:GetService("Workspace").CCoff:Destroy()
end
hookfunction(getrenv().print, function()
	return wait(math.huge)
end)
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
local rankup
b:Toggle("AutoRank",function()
    rankup = bool
end)
local c = w:CreateFolder("War Farm")
local war 
c:Toggle("War Mode",function(bool)
    war = bool
end)
local reset
c:Toggle("Reset after round 21",function(bool)
    reset = bool
end)
--Suggested by Moddi#2715
if game.Workspace:FindFirstChild("warserver") then
    local roundR = c:Label("Round: "..game.Workspace.warserver.round.Value,{
        TextSize = 25; 
        TextColor = Color3.fromRGB(255,255,255);
        BgColor = Color3.fromRGB(26,26,26); 
    }) 
end


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
game:GetService('RunService').Stepped:connect(function()
	if autofarm or war then
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
                        if v.Head.givemission.Enabled == true and v.Head.givemission.color.Image == "http://www.roblox.com/asset/?id=5459241648" --[[or v.Head.givemission.color.Image == "http://www.roblox.com/asset/?id=5459241799"]] then
                            pcall(function()
                                if TALK:WaitForChild("mobname") then
                                    local getmission = v:FindFirstChild("HumanoidRootPart")
                                    local clienttalk = v:FindFirstChild("CLIENTTALK")
                                    repeat wait()
                                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position))
                                        clienttalk:FireServer()
                                        clienttalk:FireServer("accept")
                                    until mission.Visible
                                end
                            end)
                        end
                    end
                end
            else
                for i,v in pairs(workspace.npc:GetChildren()) do
                    if v.ClassName == "Model" and v:FindFirstChild("npctype") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 then
                        repeat wait()
                            pcall(function()
                                repeat wait()
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position))
                                    if (player.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude > 50 then
                                        v.Humanoid.Health = 0
                                    end
                                until not v or v.Humanoid.Health == 0
                            end)
                        until v.Humanoid.Health == 0 or mission.Visible == false or not v or not autofarm
                    end
                end
            end
        end
    end
end)
game:GetService('RunService').Stepped:connect(function()
    if autofarm or war then
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end)
    end
end)
local function SCROLLFARM()
    for i,v in pairs(game.workspace.GLOBALTIME:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 then
            pcall(function()
                toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
            end)
            fireclickdetector(v.sh.ClickDetector)
        end
    end
end
spawn(function()
    while wait() do
        if scrollfarm then
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
            for i,v in pairs(workspace.npc:GetChildren()) do
                if v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 then
                    wait(.5)
			        --repeat wait()
                        pcall(function()
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position))
                            if (player.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude > 5 then
                                v.Humanoid.Health = 0
                            end
                        end)
                   	--until not v.Humanoid.Health == 0 or not war or not v
                end
            end
            if reset then
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v.Name == "warserver" and v:FindFirstChild("round").Value > 20 then
						repeat wait()
							player.Character:BreakJoints()
						until v.round.Value == 0
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if war then
            SCROLLFARM()
            roundR:Refresh("Round: "..game.Workspace.warserver.round.Value)
        end
    end
end)
