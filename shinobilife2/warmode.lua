repeat wait() until game:IsLoaded()
local player = game.Players.LocalPlayer
local warplace = game:GetService("Workspace"):FindFirstChild("warmode")
--loading wally ui revamped By Aika
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local w = library:CreateWindow("WAR - Shindo Life")
local c = w:CreateFolder("War Farm")
if warplace then
	--WAR
	c:Label("Snipe is built-in",{
		TextSize = 24;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(117, 50, 168);
	}) 
	local war 
	c:Toggle("Farm War",function(bool)
		war = bool
	end)
	local reset
	c:Toggle("Reset after round 21",function(bool)
		reset = bool
	end)
	--Suggested by Moddi#2715
	local refresh = c:Label("ROUND COUNTER",{
		TextSize = 24;
		TextColor = Color3.fromRGB(255,255,255); 
		BgColor = Color3.fromRGB(117, 50, 168);
	}) 
	local count = 0
	game:GetService('RunService').Stepped:connect(function()
		if war then
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
				    player.Character.HumanoidRootPart.CFrame=v.sh.CFrame
					scrollA:FireServer(game.Players.LocalPlayer)
					fireclickdetector(v.sh.ClickDetector)
				end)
			end
		end
	end
	local function SCROLLFARM1()
		for i,v in pairs(game.workspace:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and v.sh.Position.Y < 2000 then
				local scrollA = v.sh:FindFirstChild("invoke")
				print("SCROLL SPAWNED in workspace")
				pcall(function()
					player.Character.HumanoidRootPart.CFrame=v.sh.CFrame
					scrollA:FireServer(game.Players.LocalPlayer)
					fireclickdetector(v.sh.ClickDetector)
				end)
			end
		end
	end
	spawn(function()
		while wait() do
			if war then
				repeat wait()
					SCROLLFARM()
					SCROLLFARM1()
				until war
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
						    player.Character.HumanoidRootPart.CFrame=v.HumanoidRootPart.CFrame+Vector3.new(0,-8,0)
							v.Humanoid.Health = 0
						end)
					elseif v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and v:FindFirstChild("megaboss") then
						wait(6)
						pcall(function()
						    player.Character.HumanoidRootPart.CFrame=v.HumanoidRootPart.CFrame+Vector3.new(0,-8,0)
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
	local amigo,brr = pcall(function()
    game:GetService("RunService"):UnbindFromRenderStep(game.Players.LocalPlayer.Name .. "Main")
	end)
	local f = w:CreateFolder("Credits")
    f:Label("made by reav#2966 | Shindo Life ver 045.3",{
        TextSize = 15;
        TextColor = Color3.fromRGB(255,255,255); 
        BgColor = Color3.fromRGB(117, 50, 168);
    }) 
    f:Label("https://discord.gg/aDRStgw",{
        TextSize = 17;
        TextColor = Color3.fromRGB(255,255,255); 
        BgColor = Color3.fromRGB(117, 50, 168); 
    }) 
    f:Button("Copy Discord Link",function()
        setclipboard("https://discord.gg/aDRStgw")
    end)
else
    c:Label("YOU MUST RUN THIS IN WAR MODE",{
        TextSize = 15;
        TextColor = Color3.fromRGB(255,255,255); 
        BgColor = Color3.fromRGB(117, 50, 168);
    }) 
end
