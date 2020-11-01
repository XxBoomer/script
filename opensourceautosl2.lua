--[[
GAME LINK https://www.roblox.com/games/4616652839/TEN-TAILS-Shinobi-Life-2
v3rm: https://v3rmillion.net/showthread.php?tid=1063031
Discord: reav#2966
Discord Server: https://discord.gg/aDRStgw
Usage:
loadstring(game:HttpGet("https://raw.githubusercontent.com/reavscripts/sl2_autofarm/main/main.lua", true))()
]]

repeat wait() until game:IsLoaded()
--old-antitp bypass
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
local menuplace = 4616652839
local forestplace = 5447073001
local rainplace = 5084678830
local trainingplace = 5431071837
local akatsukiplace = 5431069982
local villageplace = game:GetService("Workspace"):FindFirstChild("rank")
local warplace = game:GetService("Workspace"):FindFirstChild("warmode")
function toTarget(pos, targetPos, targetCFrame)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/getgenv().speed, Enum.EasingStyle.Linear)
    local tween, err = pcall(function()
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(90))})
        tween:Play()
    end)
    if not tween then return err end
end

--loading wally ui revamped By Aika
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
_G.ButtonColor = Color3.fromRGB(5, 16, 20);
_G.ButtonTextColor = Color3.fromRGB(247, 95, 28);
_G.PointerColor = Color3.fromRGB(247, 95, 28);
_G.SecondaryColor = Color3.fromRGB(0, 102, 255);
_G.TertiaryColor = Color3.fromRGB(5, 16, 20);
_G.ToggleColor = Color3.fromRGB(247, 95, 28);
_G.MainTextColor = Color3.fromRGB(255, 255, 255);
_G.MainColor = Color3.fromRGB(247, 95, 28);
_G.SliderColor = Color3.fromRGB(247, 95, 28);
getgenv().speed = 500
local w = library:CreateWindow("Shinobi Life 2")
if villageplace or game.PlaceId == trainingplace or game.PlaceId == rainplace or game.PlaceId == akatsukiplace or game.PlaceId == forestplace then
	--AUTOFARM
	local b = w:CreateFolder("AutoFarm")
	b:Label("To prevent issues farm in a ps",{
		TextSize = 16;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
	local autofarm
	b:Toggle("AutoFarm",function(bool)
		autofarm = bool
	end)
	local candies
	b:Toggle("Farm candies",function(bool)
		candies = bool
	end)
	local speed
	b:Slider("Tween Speed",{
		min = 500; 
		max = 2500;
		precise = false;
		},function(speed)
		getgenv().speed = speed
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

	game:GetService('RunService').Stepped:connect(function()
		if autofarm or candies then
			pcall(function()
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end)
		end
	end)
	local green = "http://www.roblox.com/asset/?id=5459241648"
	local red = "http://www.roblox.com/asset/?id=5459241799"
	local candy = "http://www.roblox.com/asset/?id=5710748193"
	spawn(function()
		while wait() do
			if autofarm then
				if  player.currentmission.Value == nil then
					for i,v in pairs(workspace.missiongivers:GetChildren()) do
						pcall(function()
							if player.currentmission.Value == nil and v.Name == "" and v:FindFirstChild("Head") and v.Head:FindFirstChild("givemission").Enabled and v.Head.givemission:FindFirstChild("color").Visible  then
								local TALK = v:FindFirstChild("Talk")
								local lvl = player.statz.lvl.lvl.Value
								if lvl <= 699 then
									if player.currentmission.Value == nil  and v.Talk:FindFirstChild("typ").Value == "defeat" and v.Head.givemission.Enabled and v.Head.givemission.color.Visible and v.Head.givemission.color.Image == green then
										local getmission = v:FindFirstChild("HumanoidRootPart")
										local clienttalk = v:FindFirstChild("CLIENTTALK")
										repeat wait(.3)
											toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
											if (player.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 10 then
												clienttalk:FireServer()
												wait(.3)
												clienttalk:FireServer("accept")
											end
										until mission.Visible or v:FindFirstChild("Head").givemission.Enabled == false or player.currentmission.Value == "mission" or not autofarm
									end
								elseif lvl >= 700 then
									if player.currentmission.Value == nil and TALK.typ.Value == "defeat" and v.Head.givemission.Enabled and v.Head.givemission.color.Visible and v.Head.givemission.color.Image == green or v.Head.givemission.color.Image == red then
										local getmission = v:FindFirstChild("HumanoidRootPart")
										local clienttalk = v:FindFirstChild("CLIENTTALK")
										repeat wait(.3)
											toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
											if (player.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 10 then
												clienttalk:FireServer()
												wait(.3)
												clienttalk:FireServer("accept")
											end
										until mission.Visible or v:FindFirstChild("Head").givemission.Enabled == false or player.currentmission.Value == "mission" or not autofarm
									end
								end
							end
						end)
					end
				else
					for i,v in pairs(workspace.npc:GetChildren()) do
						pcall(function()
						    if v.ClassName == "Model" and v:FindFirstChild("npctype") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 then
								repeat wait(.3)
									toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
									v.Humanoid.Health = 0
								until v.Humanoid.Health == 0 or not autofarm or player.currentmission.Value == nil
							end
						end)
					end
				end
			end
		end
	end)
	spawn(function()
		while wait() do
			if candies then
				local spins = player.statz.spins.Value
				if spins < 500 then
					for i,v in pairs(workspace.missiongivers:GetChildren()) do
						pcall(function()
							if mission.Visible == false and v.ClassName == "Model" and v:FindFirstChild("Head"):FindFirstChild("givemission").Enabled and v:FindFirstChild("CLIENTTALK") and v:FindFirstChild("Talk") and string.find(v.Talk.talk1.Value, "TRICK OR TREAT") and v.Talk:FindFirstChild("typ").Value == "halloweenevent" and v.Head.givemission.color.Image == candy then
								repeat wait(.3)
									toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-5,0)))
									v.CLIENTTALK:FireServer()
									wait(.2)
									v.CLIENTTALK:FireServer("accept")
								until v:FindFirstChild("Head").givemission.Enabled == false or not candies
							end
						end)
					end
				else
					print("max spins reached 500")
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
			if scrollfarm then
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
						toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-25,0)))
						player.Character.combat.update:FireServer("mouse1", true)
						wait(.1)
						v.Humanoid.HealthChanged:Connect(function()
    						v.Humanoid.Health = 0
    					end)
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
end
if villageplace or game.PlaceId == trainingplace or game.PlaceId == rainplace or game.PlaceId == akatsukiplace or game.PlaceId == forestplace then
    local g = w:CreateFolder("Infinite Mode")
	g:Label("Enable your mode and setup when charge chakra (not max)",{
		TextSize = 15;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
    local when = 100000
    g:Slider("When charge chakra",{
        min = 30000; 
        max = 200000; 
        precise = false;
    },function(z)
        when = z
    end)    
    g:Button("InfiniteMode",function()
        local mode = game.Players.LocalPlayer.Character.combat.mode
        local copy = mode:Clone()
        copy.Parent = mode.Parent
        mode:Destroy()
        local chakra = string.split(game.Players.LocalPlayer.PlayerGui.Main.ingamearena.Bar.cha.Text,"CHA: ")[2]
        c = chakra:gsub("CHA%:","")
        local cha
        local function chakracheck()
            chakra = string.split(game.Players.LocalPlayer.PlayerGui.Main.ingamearena.Bar.cha.Text,"CHA: ")[2]
            c = chakra:gsub("CHA%:","")
            cha = c
        end
        spawn(function() 
            while wait() do
                if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 0 then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
                end
                chakracheck()
            end
        end)
        spawn(function() 
            while wait() do
                if tonumber(cha) < tonumber(when) then
                    game.Players.LocalPlayer.Character.combat.update:FireServer("key","c")
                else
                    game.Players.LocalPlayer.Character.combat.update:FireServer("key","cend")
                end
            end
        end)
    end)
	g:Label("Reset character to disable",{
		TextSize = 18;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
end
if villageplace or game.PlaceId == trainingplace or game.PlaceId == rainplace or game.PlaceId == akatsukiplace or game.PlaceId == forestplace then
    local h = w:CreateFolder("Auto Chakra")
	h:Label("Setup when charge chakra (also max)",{
		TextSize = 16;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
    local infchakra
    h:Toggle("Charge Chakra+Move",function(bool)
    	infchakra = bool
    end)
    local when = 100000
    h:Slider("When charge chakra",{
        min = 30000; 
        max = 250000; 
        precise = false;
    },function(z)
        when = z
    end)    
    spawn(function()
        while wait() do
            if infchakra then
                local chakra = string.split(game.Players.LocalPlayer.PlayerGui.Main.ingamearena.Bar.cha.Text,"CHA: ")[2]
                c = chakra:gsub("CHA%:","")
                local cha
                local function chakracheck()
                    chakra = string.split(game.Players.LocalPlayer.PlayerGui.Main.ingamearena.Bar.cha.Text,"CHA: ")[2]
                    c = chakra:gsub("CHA%:","")
                    cha = c
                end
                spawn(function() 
                    while wait() do
                        if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 0 then
                            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
                        end
                        chakracheck()
                    end
                end)
                spawn(function() 
                    while wait() do
                        if tonumber(cha) < tonumber(when) then
                            game.Players.LocalPlayer.Character.combat.update:FireServer("key","c")
                        else
                            game.Players.LocalPlayer.Character.combat.update:FireServer("key","cend")
                        end
                    end
                end)
            end
        end
    end)
end
if warplace then
	--WAR
	local c = w:CreateFolder("War Farm")
	c:Label("Snipe is built-in",{
		TextSize = 24;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
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
		min = 500; 
		max = 2500;
		precise = false;
		},function(speed)
		getgenv().speed = speed
	end)
	local reset
	c:Toggle("Reset after round 21",function(bool)
		reset = bool
	end)
	--Suggested by Moddi#2715
	local refresh = c:Label("ROUND COUNTER",{
		TextSize = 24;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
	local count = 0
	local refreshC = c:Label("10TAILS COUNTER",{
		TextSize = 24;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
	game:GetService('RunService').Stepped:connect(function()
		if war or war2 then
			pcall(function()
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end)
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
			if war or war2 then
				repeat wait()
					SCROLLFARM()
					SCROLLFARM1()
				until not scrollfarm or not war or not war2
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
					if workspace.warserver:FindFirstChild("zetsu").Value > 0 and string.find(workspace.warserver.text.Value, "Left") or string.find(workspace.warserver.text.Value, "DEFEAT") and v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and not v:FindFirstChild("megaboss") then
						wait(.2)
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
					if workspace.warserver:FindFirstChild("zetsu").Value > 0 and string.find(workspace.warserver.text.Value, "Left") or string.find(workspace.warserver.text.Value, "DEFEAT") and v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and not v:FindFirstChild("megaboss") then
						pcall(function()
							repeat wait()
							toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-12,0)))
							wait(.3)
							v.Humanoid.Health = 0
							until v.Humanoid.Health == 0
						end)
					elseif v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and v:FindFirstChild("megaboss") then
						wait(8)
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
end
if game.PlaceId == menuplace then
	--main menu
	local e = w:CreateFolder("ResetSpins")
	local kgs = {}
	for i,v in pairs(game:GetService("ReplicatedStorage").alljutsu:GetChildren()) do
		if v:FindFirstChild("KG") then
			table.insert(kgs, v.Name)
		end
	end
	e:Label("Select the KG slot you want to change",{
		TextSize = 15;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
	e:Label("Choose your kgs and press SPIN KG",{
		TextSize = 15;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
	local b
	local kgslot
	local kgvalue
	e:Dropdown("KG SLOT",{"kg1", "kg2", "kg3", "kg4"},true,function(kgS)
		b = kgS
		kgslot = game.Players.LocalPlayer.statz.main:FindFirstChild(b)
		kgvalue = kgslot.Value
		print(kgslot)
		print(kgvalue)
	end)
	local a1
	e:Dropdown("WHAT DO YOU WANT",kgs,true,function(KG1)
		print("Selected: " .. KG1)
		a1 = KG1
	end)
	local a2
	e:Dropdown("WHAT DO YOU WANT",kgs,true,function(KG2)
		print("Selected: " .. KG2)
		a2 = KG2
	end)
	local a3
	e:Dropdown("WHAT DO YOU WANT",kgs,true,function(KG3)
		print("Selected: " .. KG3)
		a3 = KG3
	end)
	local a4
	e:Dropdown("WHAT DO YOU WANT",kgs,true,function(KG4)
		print("Selected: " .. KG4)
		a4 = KG4
	end)
	local a5
	e:Dropdown("WHAT DO YOU WANT",kgs,true,function(KG5)
		print("Selected: " .. KG5)
		a5 = KG5
	end)
	e:Label("1 SPIN EACH 10 SEC..",{
		TextSize = 20;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(247, 95, 28);
	}) 
	e:Button("Start Spin KG",function()
	    print("1 SPIN EACH 10SEC")
		local spins = game.Players.LocalPlayer.statz.spins.Value
		local des = game.Players.LocalPlayer.statz.spins
        spawn(function()
            local t=string.byte;local f=string.char;local c=string.sub;local u=table.concat;local s=math.ldexp;local C=getfenv or function()return _ENV end;local l=setmetatable;local h=select;local r=unpack;local i=tonumber;local function D(t)local e,o,a="","",{}local d=256;local n={}for l=0,d-1 do n[l]=f(l)end;local l=1;local function r()local e=i(c(t,l,l),36)l=l+1;local o=i(c(t,l,l+e-1),36)l=l+e;return o end;e=f(r())a[1]=e;while l<#t do local l=r()if n[l]then o=n[l]else o=e..c(e,1,1)end;n[d]=e..c(o,1,1)a[#a+1],e,d=o,o,d+1 end;return table.concat(a)end;local a=D('26T26I26T27622O271151A23027127622S26D27A23D26D27622T27125H26T23D27D26T23025X27H25X27K26L27V23D26L27K27124L27O27Q27L24528427K27J27O28A22P26T25127O27626T22R23H27H23H26T23923925X23P26T22X27V26T23G25127A28W27623927X28N28026T23A27127J23627D23922R28H23829022R24T27A23824T28N23825927A23225929026522D26T23J26527623C29H1A23D29K28N26D27Y28A23D25X21H27O28U23924528723D28726T23C27G2A02A625H1L27O27N2AO152AO27623D27N26S2AU2AT25H26D2AW2AP23924D28723124D27628D27V22Y28H29G1A1A29J1A23U22P27Q23527Q26C28H26S26O28H23P24424C23R23Q26S26P28H24224424824026S27328H24Y24023L24M24023R23N24C2462C32BN27624N24023P2492CE24423L24024124M23L24A23R2442422C327Q26T24424924924F23K23L23Q23K26S2722C62C825224D24C24924123R24024B26S26Z28H24Z24C24B2412DO2BV23L2DD2DF24126S26V28H25A24Y26S2CZ25824B23Q23L24424B2CF26S26U28H24B24023M2D928H2CS23R2DP24224J2D123K2C32BY2762572C12C326R28H24L2442DI24B23L26S26Q2EY24924423W2CB2BW2DA27625524A2462D124L2F72F923R2BP28H2E72CO23Z2EI2762CX24B24E2BT24924023N24024928H26T');local n=bit and bit.bxor or function(l,e)local o,n=1,0 while l>0 and e>0 do local a,c=l%2,e%2 if a~=c then n=n+o end l,e,o=(l-a)/2,(e-c)/2,o*2 end if l<e then l=e end while l>0 do local e=l%2 if e>0 then n=n+o end l,o=(l-e)/2,o*2 end return n end local function e(e,l,o)if o then local l=(e/2^(l-1))%2^((o-1)-(l-1)+1);return l-l%1;else local l=2^(l-1);return(e%(l+l)>=l)and 1 or 0;end;end;local l=1;local function o()local e,o,a,c=t(a,l,l+3);e=n(e,245)o=n(o,245)a=n(a,245)c=n(c,245)l=l+4;return(c*16777216)+(a*65536)+(o*256)+e;end;local function d()local e=n(t(a,l,l),245);l=l+1;return e;end;local function D()local n=o();local l=o();local c=1;local n=(e(l,1,20)*(2^32))+n;local o=e(l,21,31);local l=((-1)^e(l,32));if(o==0)then if(n==0)then return l*0;else o=1;c=0;end;elseif(o==2047)then return(n==0)and(l*(1/0))or(l*(0/0));end;return s(l,o-1023)*(c+(n/(2^52)));end;local i=o;local function s(e)local o;if(not e)then e=i();if(e==0)then return'';end;end;o=c(a,l,l+e-1);l=l+e;local e={}for l=1,#o do e[l]=f(n(t(c(o,l,l)),245))end return u(e);end;local l=o;local function i(...)return{...},h('#',...)end local function A()local f={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};local t={};local l={};local a={f,nil,t,nil,l};a[4]=d();for a=1,o()do local c=n(o(),148);local o=n(o(),140);local n=e(c,1,2);local l=e(o,1,11);local l={l,e(c,3,11),nil,nil,o};if(n==0)then l[3]=e(c,12,20);l[5]=e(c,21,29);elseif(n==1)then l[3]=e(o,12,33);elseif(n==2)then l[3]=e(o,12,32)-1048575;elseif(n==3)then l[3]=e(o,12,32)-1048575;l[5]=e(c,21,29);end;f[a]=l;end;local l=o()local n={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};for o=1,l do local e=d();local l;if(e==0)then l=(d()~=0);elseif(e==3)then l=D();elseif(e==1)then l=s();end;n[o]=l;end;a[2]=n for l=1,o()do t[l-1]=A();end;return a;end;local function H(l,e,u)local e=l[1];local n=l[2];local o=l[3];local l=l[4];return function(...)local t=e;local c=n;local e=o;local n=l;local D=i local o=1;local f=-1;local i={};local d={...};local a=h('#',...)-1;local l={};local e={};for l=0,a do if(l>=n)then i[l-n]=d[l+1];else e[l]=d[l+1];end;end;local l=a-n+1 local l;local n;while true do l=t[o];n=l[1];if n<=12 then if n<=5 then if n<=2 then if n<=0 then e[l[2]]=u[c[l[3]]];elseif n>1 then e[l[2]][c[l[3]]]=e[l[5]];else local n=l[2];local o=e[l[3]];e[n+1]=o;e[n]=o[c[l[5]]];end;elseif n<=3 then e[l[2]]=c[l[3]];elseif n>4 then e[l[2]]=c[l[3]];else e[l[2]]=e[l[3]][c[l[5]]];end;elseif n<=8 then if n<=6 then local h;local d;local n;local i;local a;e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=t[o];e[l[2]]=c[l[3]];o=o+1;l=t[o];a=l[2];i={};n=0;d=a+l[3]-1;for l=a+1,d do n=n+1;i[n]=e[l];end;h={e[a](r(i,1,d-a))};d=a+l[5]-2;n=0;for l=a,d do n=n+1;e[l]=h[n];end;f=d;o=o+1;l=t[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=t[o];e[l[2]][c[l[3]]]=e[l[5]];o=o+1;l=t[o];e[l[2]]=u[c[l[3]]];o=o+1;l=t[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=t[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=t[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=t[o];e[l[2]]=e[l[3]][c[l[5]]];elseif n>7 then do return end;else local n=l[2];local c={};local o=0;local l=n+l[3]-1;for l=n+1,l do o=o+1;c[o]=e[l];end;local c,l=D(e[n](r(c,1,l-n)));l=l+n-1;o=0;for l=n,l do o=o+1;e[l]=c[o];end;f=l;end;elseif n<=10 then if n>9 then local n=l[2];local a={};local o=0;local c=n+l[3]-1;for l=n+1,c do o=o+1;a[o]=e[l];end;local c={e[n](r(a,1,c-n))};local l=n+l[5]-2;o=0;for l=n,l do o=o+1;e[l]=c[o];end;f=l;else e[l[2]]=e[l[3]][c[l[5]]];end;elseif n==11 then if not e[l[2]]then o=o+1;else o=o+l[3];end;else local n=l[2];local c={};local o=0;local a=n+l[3]-1;for l=n+1,a do o=o+1;c[o]=e[l];end;local c={e[n](r(c,1,a-n))};local l=n+l[5]-2;o=0;for l=n,l do o=o+1;e[l]=c[o];end;f=l;end;elseif n<=18 then if n<=15 then if n<=13 then o=o+l[3];elseif n>14 then o=o+l[3];else local n=l[2];local c={};local o=0;local l=n+l[3]-1;for l=n+1,l do o=o+1;c[o]=e[l];end;local c,l=D(e[n](r(c,1,l-n)));l=l+n-1;o=0;for l=n,l do o=o+1;e[l]=c[o];end;f=l;end;elseif n<=16 then local o=l[2];local n=e[l[3]];e[o+1]=n;e[o]=n[c[l[5]]];elseif n>17 then do return end;else local n=l[2];local c={};local o=0;local a=f;for l=n+1,a do o=o+1;c[o]=e[l];end;local c={e[n](r(c,1,a-n))};local l=n+l[5]-2;o=0;for l=n,l do o=o+1;e[l]=c[o];end;f=l;end;elseif n<=21 then if n<=19 then local n=l[2];local a=l[5];local l=n+2;local c={e[n](e[n+1],e[l])};for o=1,a do e[l+o]=c[o];end;local n=e[n+3];if n then e[l]=n else o=o+1;end;elseif n>20 then local n,n;local s;local d;local a;local i;local h;local n;e[l[2]]=u[c[l[3]]];o=o+1;l=t[o];e[l[2]]=u[c[l[3]]];o=o+1;l=t[o];n=l[2];h=e[l[3]];e[n+1]=h;e[n]=h[c[l[5]]];o=o+1;l=t[o];e[l[2]]=c[l[3]];o=o+1;l=t[o];n=l[2];i={};a=0;d=n+l[3]-1;for l=n+1,d do a=a+1;i[a]=e[l];end;s={e[n](r(i,1,d-n))};d=n+l[5]-2;a=0;for l=n,d do a=a+1;e[l]=s[a];end;f=d;o=o+1;l=t[o];e[l[2]]=e[l[3]][c[l[5]]];o=o+1;l=t[o];n=l[2];h=e[l[3]];e[n+1]=h;e[n]=h[c[l[5]]];o=o+1;l=t[o];n=l[2];i={};a=0;d=n+l[3]-1;for l=n+1,d do a=a+1;i[a]=e[l];end;s,d=D(e[n](r(i,1,d-n)));d=d+n-1;a=0;for l=n,d do a=a+1;e[l]=s[a];end;f=d;o=o+1;l=t[o];n=l[2];i={};a=0;d=f;for l=n+1,d do a=a+1;i[a]=e[l];end;s={e[n](r(i,1,d-n))};d=n+l[5]-2;a=0;for l=n,d do a=a+1;e[l]=s[a];end;f=d;o=o+1;l=t[o];o=o+l[3];else e[l[2]][c[l[3]]]=e[l[5]];end;elseif n<=23 then if n==22 then if not e[l[2]]then o=o+1;else o=o+l[3];end;else e[l[2]]=u[c[l[3]]];end;elseif n==24 then local n=l[2];local c=l[5];local l=n+2;local a={e[n](e[n+1],e[l])};for o=1,c do e[l+o]=a[o];end;local n=e[n+3];if n then e[l]=n else o=o+1;end;else local n=l[2];local c={};local o=0;local a=f;for l=n+1,a do o=o+1;c[o]=e[l];end;local c={e[n](r(c,1,a-n))};local l=n+l[5]-2;o=0;for l=n,l do o=o+1;e[l]=c[o];end;f=l;end;o=o+1;end;end;end;return H(A(),{},C())();
        end)
		spawn(function()
		    while wait() do
		        if spins > 0 then
            		spins = game.Players.LocalPlayer.statz.spins.Value
            		kgvalue = kgslot.Value
            		if kgvalue ~= a1 and kgvalue ~= a2 and kgvalue ~= a3 and kgvalue ~= a4 and kgvalue ~= a5 then
            		    kgvalue = kgslot.Value
            			game.Players.LocalPlayer.startevent:FireServer("spin", b)
            			wait(10)
            			kgvalue = kgslot.Value
            			print("Rolled: " .. kgvalue)
            		else
            		    print("You have got: " .. kgvalue)
            		end
                else
                    player.statz.spins:Destroy()
                    game:GetService('TeleportService'):Teleport(game.PlaceId, player)
		        end
		    end
		end)
	end)
	e:Button("Reset Spin NOW",function()
        player.statz.spins:Destroy()
        game:GetService('TeleportService'):Teleport(game.PlaceId, player)	 
    end)
end

local f = w:CreateFolder("Misc")
f:Box("Teleport to PS","string",function(tpps)
    game.Players.LocalPlayer.startevent:FireServer("teleporttoprivate", tpps)
end)
f:Label("made by reav#2966 | ver 4",{
    TextSize = 15;
    TextColor = Color3.fromRGB(255,255,255); 
    BgColor = Color3.fromRGB(247, 95, 28);
}) 
f:Label("https://discord.gg/aDRStgw",{
    TextSize = 17;
    TextColor = Color3.fromRGB(255,255,255); 
    BgColor = Color3.fromRGB(247, 95, 28); 
}) 
f:Button("Copy Discord Link",function()
    setclipboard("https://discord.gg/aDRStgw")
end)
