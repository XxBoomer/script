repeat  task.wait() until game:IsLoaded()
local Formated = {
	["k"] = "000",
	["m"] = "000000",
	["b"] = "000000000",
	["t"] = "000000000000",
	["qa"] = "000000000000000",
	["qi"] = "000000000000000000",
	["sx"] = "000000000000000000000",
	["sp"] = "000000000000000000000000",
}
function ParseNumber(n)
	for i, v in pairs(Formated) do
		n = n:gsub(i, v)
	end
	if string.find(n, "%.") then
		n = n:gsub("%.", "")
		n = n:sub(1, #n-1)
	end
	return n
end

local plr = game:GetService("Players").LocalPlayer
--detect expoiter
for _, v in pairs(plr.PlayerGui:GetChildren()) do
	if v:IsA("LocalScript") and string.len(v.Name) > 15 then
		v.IAmExploiter:Destroy()
	else
		break
	end
end
--script
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Arm Wrestling Simulator", HidePremium = false, SaveConfig = true, ConfigFolder = "AWS", IntroText = "Arm Wrestling Simulator"})

local Stuff = Window:MakeTab({
	Name = "Stuff",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local click = Stuff:AddSection({
	Name = "Auto Click"
})
local rebirth = Stuff:AddSection({
	Name = "Auto Rebirth"
})
local claimgift = Stuff:AddSection({
	Name = "Claim Gift"
})
local claimdaily = Stuff:AddSection({
	Name = "Redeem Daily"
})

local Battle = Window:MakeTab({
	Name = "Battle",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local bttle = Battle:AddSection({
	Name = "Boss"
})
local lg = Battle:AddSection({
	Name = "League"
})

local Event = Window:MakeTab({
	Name = "Event",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local eveegg = Event:AddSection({
	Name = "Eggs Available"
})
local Boss = Event:AddSection({
	Name = "Boss"
})

local Teleport = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local tp = Teleport:AddSection({
	Name = "Teleport World"
})

local poi = Window:MakeTab({
	Name = "Poison",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Poison = poi:AddSection({
	Name = "Use Poison"
})

local htcher = Window:MakeTab({
	Name = "Hatcher",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local hatcher = htcher:AddSection({
	Name = "Hatcher"
})
local expter = Window:MakeTab({
	Name = "Exploits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local exploiters = expter:AddSection({
	Name = "Exploits"
})
local triplefarm = expter:AddSection({
	Name = "Exploits - Triple Farm"
})

local Toggle = Window:MakeTab({
	Name = "Toggle",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local destroy = Toggle:AddSection({
	Name = "destroy ui"
})

local function aturb(autorebirth)
	_G.autorebirth = autorebirth
	while _G.autorebirth do wait() 
		pcall(function()
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.RebirthService.RE.onRebirthRequest:FireServer()
		end)
	end
end
local function gift(claimgift)
	_G.claimgift = claimgift
	while _G.claimgift do
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("1")
		wait(0.5)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("2")
		wait(0.5)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("3")
		wait(0.5)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("4")
		wait(0.5)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("5")
		wait(0.5)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("6")
		wait(0.5)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("7")
		wait(0.5)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("8")
		wait(0.5)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("9")
		wait(0.5)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("10")
		wait(0.5)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("11")
		wait(0.5)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("12")
		wait(15)
	end
end
local function rjgift(rjfull12)
	_G.rjfull12 = rjfull12
	while _G.rjfull12 do
		if plr.PlayerGui.GameUI.RightMenu.Gifts.Icon.Text == "ALL CLAIMED!" then
			game:GetService('TeleportService'):Teleport(game.PlaceId)
		end
		wait(30)
	end
end

local function Spin(autospin)
	_G.autospin = autospin
	while _G.autospin do
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.SpinService.RE.onSpinRequest:FireServer()
		wait(30)
	end
end
local function atoclick(autoclick)
	_G.autoclick = autoclick
	while _G.autoclick do wait() 
		pcall(function()
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
		end)
	end
end
local function atojoinboss(joinboss)
	_G.joinboss = joinboss
	while _G.joinboss do 
		if bossevent == "RipperDoc" then 
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("RipperDoc",workspace.Zones["2"].Interactables.ArmWrestling.NPC.RipperDoc,"2")
		elseif bossevent == "CocoNut" then 
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("CocoNut",workspace.Zones["3"].Interactables.ArmWrestling.NPC.CocoNut,"3")
		end
		wait(0.8)
	end
end
local function atoopenegg(openegg)
	_G.openegg = openegg
	while _G.openegg do 
		if eggchoose == "X1" then 
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EventService.RF.ClaimEgg:InvokeServer()
		elseif eggchoose == "X3" then 
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EventService.RF.ClaimEgg:InvokeServer(3)
		elseif eggchoose == "X8" then
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EventService.RF.ClaimEgg:InvokeServer(8)
		end
		wait(1)
	end
end
local function atubttboss(bttbss)
	_G.bttbss = bttbss
	while _G.bttbss do 
		if bosschoose == "Bully" then 
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("Bully",workspace.Zones["1"].Interactables.ArmWrestling.NPC.Bully,"1")
		elseif bosschoose == "Teacher" then 
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("Teacher",workspace.Zones["1"].Interactables.ArmWrestling.NPC.Teacher,"1")
		elseif bosschoose == "GymRat" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("GymRat",workspace.Zones["1"].Interactables.ArmWrestling.NPC.GymRat,"1")
		elseif bosschoose == "MafiaBoss" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("MafiaBoss",workspace.Zones["1"].Interactables.ArmWrestling.NPC.MafiaBoss,"1")
		elseif bosschoose == "Champion" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("Champion",workspace.Zones["1"].Interactables.ArmWrestling.NPC.Champion,"1")
		elseif bosschoose == "ScrapTrader" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("ScrapTrader",workspace.Zones["2"].Interactables.ArmWrestling.NPC.ScrapTrader,"2")
		elseif bosschoose == "CyberCop" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("CyberCop",workspace.Zones["2"].Interactables.ArmWrestling.NPC.CyberCop,"2")
		elseif bosschoose == "SlicerAssassin" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("SlicerAssassin",workspace.Zones["2"].Interactables.ArmWrestling.NPC.SlicerAssassin,"2")
		elseif bosschoose == "RipperDoc" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("RipperDoc",workspace.Zones["2"].Interactables.ArmWrestling.NPC.RipperDoc,"2")
		elseif bosschoose == "RogueAi" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("RogueAi",workspace.Zones["2"].Interactables.ArmWrestling.NPC.RogueAi,"2")
		elseif bosschoose == "CocoNut" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("CocoNut",workspace.Zones["3"].Interactables.ArmWrestling.NPC.CocoNut,"3")
		elseif bosschoose == "FatPirate" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("FatPirate",workspace.Zones["3"].Interactables.ArmWrestling.NPC.FatPirate,"3")
		elseif bosschoose == "MermaidKing" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("MermaidKing",workspace.Zones["3"].Interactables.ArmWrestling.NPC.MermaidKing,"3")
		elseif bosschoose == "FriendlyShark" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("FriendlyShark",workspace.Zones["3"].Interactables.ArmWrestling.NPC.FriendlyShark,"3")
		elseif bosschoose == "KrakenBoss" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("KrakenBoss",workspace.Zones["3"].Interactables.ArmWrestling.NPC.KrakenBoss,"3")
		elseif bosschoose == "Barbarian" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("Barbarian",workspace.Zones["4"].Interactables.ArmWrestling.NPC.CocoNut,"4")
		elseif bosschoose == "Hazmat" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("Hazmat",workspace.Zones["4"].Interactables.ArmWrestling.NPC.Hazmat,"4")
		elseif bosschoose == "Enforcer" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("Enforcer",workspace.Zones["4"].Interactables.ArmWrestling.NPC.Enforcer,"4")
		elseif bosschoose == "Bulk" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("Bulk",workspace.Zones["4"].Interactables.ArmWrestling.NPC.Bulk,"4")
		elseif bosschoose == "MutantKing" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("MutantKing",workspace.Zones["4"].Interactables.ArmWrestling.NPC.MutantKing,"4")
		end
		wait(1)
	end
end

fightstat = lg:AddParagraph("Status","Turn on to find League\nEnergy: "..plr.PlayerGui.GameUI.Menus.Leagues.Navbar.Targets.EnergyBar.Amount.Text.."\nPlayer: No Player Targetted")
local function fleague(fightleague)
	_G.fightleague = fightleague
	while _G.fightleague do wait()
		pcall(function()
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.LeagueService.RF.FindTargetInPlayerLeagueTier:InvokeServer()
			fightstat:Set("Waiting for League To start\nEnergy: "..plr.PlayerGui.GameUI.Menus.Leagues.Navbar.Targets.EnergyBar.Amount.Text.."\nPlayer: Finding Player...")
			if plr.PlayerGui.GameUI.Menus.LeagueTarget.Content.Stats.Left.BicepPower then
				fightstat:Set("Found League Match\nEnergy: "..plr.PlayerGui.GameUI.Menus.Leagues.Navbar.Targets.EnergyBar.Amount.Text.."\nPlayer: Found "..plr.PlayerGui.GameUI.Menus.LeagueTarget.Content.PlayerName.Text.."Stars: "..plr.PlayerGui.GameUI.Menus.LeagueTarget.Content.Stats.Right.Wins.Text)
				lbicep = ParseNumber(plr.PlayerGui.GameUI.Menus.LeagueTarget.Content.Stats.Left.BicepPower.Text)
				lhand = ParseNumber(plr.PlayerGui.GameUI.Menus.LeagueTarget.Content.Stats.Left.HandStrength.Text)
				lknu = ParseNumber(plr.PlayerGui.GameUI.Menus.LeagueTarget.Content.Stats.Right.KnuckleStrength.Text)
				anotherleague = lbicep+lhand+lknu
				mb = ParseNumber(plr.leaderstats.Biceps.Value)
				mh = ParseNumber(plr.leaderstats.Hands.Value)
				lk = ParseNumber(plr.leaderstats.Knuckles.Value)
				myleague = mb+mh+lk
				if anotherleague > myleague then
					fightstat:Set("Waiting for League To start\nEnergy: "..plr.PlayerGui.GameUI.Menus.Leagues.Navbar.Targets.EnergyBar.Amount.Text.."\nPlayer: He Strong Than You Skip...")
					game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.LeagueService.RF.FindTargetInPlayerLeagueTier:InvokeServer()
					wait(4)
				else
					firesignal(plr.PlayerGui.GameUI.Menus.LeagueTarget.Navbar.Fight.MouseButton1Click)
				end
			else
				fightstat:Set("Waiting for League To start\nEnergy: "..plr.PlayerGui.GameUI.Menus.Leagues.Navbar.Targets.EnergyBar.Amount.Text.."\nPlayer: No Target Found")
			end
		end)
		wait(2)
	end
end

local function atocraft(autocraft)
	_G.autocraft = autocraft
	while _G.autocraft do wait() 
		pcall(function()
			firesignal(game:GetService("Workspace").GameUI.Menus.PetInventory.Toolbar.CraftAll.MouseButton1Click)
		end)
		wait(8)
	end
end

local function atoegg(autoegg)
	_G.autoegg = autoegg
	while _G.autoegg do wait() 
		if eggpick == "Earth" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Earth",{})
		elseif eggpick == "Icy" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Icy",{})
		elseif eggpick == "Lava" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Lava",{})
		elseif eggpick == "Blackhole" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Blackhole",{})
		elseif eggpick == "Crystal" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Crystal",{})
		elseif eggpick == "Molton" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Molton",{})
		elseif eggpick == "Solar" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Solar",{})
		elseif eggpick == "Moon" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Moon",{})
		elseif eggpick == "Ice" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Ice",{})
		elseif eggpick == "Burning" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Burning",{})
		elseif eggpick == "Coconut" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Coconut",{})
		elseif eggpick == "Palm" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Palm",{})
		elseif eggpick == "Treasure" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Treasure",{})
		elseif eggpick == "Clam" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Clam",{})
		elseif eggpick == "KingFish" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("KingFish",{})
		elseif eggpick == "Poseidon" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Poseidon",{})
		elseif eggpick == "Rust" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Rust",{})
		elseif eggpick == "Iridescent" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Iridescent",{})
		elseif eggpick == "Atom" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Atom",{})
		elseif eggpick == "Iridescent" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Iridescent",{})
		elseif eggpick == "Mutant" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Mutant",{})
		elseif eggpick == "Nuclear" then
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer("Nuclear",{})
		end
		wait(1)
	end
end
local function trpfarm(autotripfarm)
	wait(0.3)
	_G.autotripfarm = autotripfarm
	while _G.autotripfarm do wait()
		if wld == "1" and pbtrp == "Tier1" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10224.6035, 4.95242405, 114.687218, 0.0157048535, 0, -0.999876618, -0, 1, -0, 0.999876738, 0, 0.0157048516)
		elseif wld == "1" and pbtrp == "Tier2" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10224.7969, 4.95242357, 123.863335, 0.0154508492, 0, -0.999880612, -0, 1.00000012, -0, 0.999880731, 0, 0.0154508473)
		elseif wld == "1" and pbtrp == "Tier3" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10227.8682, 4.95242357, 128.851959, -0.699017823, 0, -0.715104282, 0, 1, -0, 0.715104282, -0, -0.699017823)
		elseif wld == "1" and pbtrp == "Tier4" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10235.3633, 4.95242357, 129.911011, -0.987597466, 0, -0.157007262, 0, 1, -0, 0.157007262, -0, -0.987597466)
		elseif wld == "1" and pbtrp == "Tier5" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10244.6094, 4.95242357, 129.781738, -0.998766243, 0, -0.0496588722, 0, 1, -0, 0.0496588722, -0, -0.998766243)
		elseif wld == "1" and pbtrp == "Tier6" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10253.6973, 4.95242357, 129.786392, -0.996648431, 0, -0.0818045139, 0, 1, -0, 0.0818045139, -0, -0.996648431)
		elseif wld == "1" and pbtrp == "VIP" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10262.1826, 4.95242357, 128.245285, -0.998737335, 0, -0.050238058, 0, 1, -0, 0.0502380654, -0, -0.998737216)
		elseif wld == "2" and pbtrp == "Tier1" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10336.5244, 4.95242357, 616.431885, 0.970294178, 0, -0.241927996, -0, 1.00000012, -0, 0.241927966, 0, 0.970294297)
		elseif wld == "2" and pbtrp == "Tier2" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10336.5244, 4.95242357, 616.431885, 0.970294178, 0, -0.241927996, -0, 1.00000012, -0, 0.241927966, 0, 0.970294297)
		elseif wld == "2" and pbtrp == "Tier3" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10334.6328, 4.95242357, 599.289062, 0.999534309, 0, -0.0305146966, -0, 1, -0, 0.0305146966, 0, 0.999534309)
		elseif wld == "2" and pbtrp == "Tier4" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10334.6328, 4.95242357, 599.289062, 0.999534309, 0, -0.0305146966, -0, 1, -0, 0.0305146966, 0, 0.999534309)
		elseif wld == "2" and pbtrp == "Tier5" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10334.5088, 4.95242357, 579.13501, 0.984350443, 0, 0.176222175, 0, 1, -0, -0.176222175, 0, 0.984350443)
		elseif wld == "2" and pbtrp == "Tier6" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10334.5088, 4.95242357, 579.13501, 0.984350443, 0, 0.176222175, 0, 1, -0, -0.176222175, 0, 0.984350443)
		elseif wld == "2" and pbtrp == "VIP" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10334.6699, 4.95242357, 570.575684, -0.989552081, 0, 0.144176185, 0, 1.00000012, -0, -0.144176185, 0, -0.989552081)
		elseif wld == "3" and pbtrp == "Tier1" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(11557.5312, 9.68262577, 126.797813, 0.177241549, 0, 0.984167397, 0, 1, -0, -0.984167397, 0, 0.177241549)
		elseif wld == "3" and pbtrp == "Tier2" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(11556.3086, 9.68262386, 118.395828, 0.00588748837, 0, 0.999982655, 0, 1, -0, -0.999982655, 0, 0.00588748837)
		elseif wld == "3" and pbtrp == "Tier3" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(11556.9023, 9.68262386, 109.582298, -0.318171322, 0, 0.948033214, 0, 1.00000012, -0, -0.948033333, 0, -0.318171293)
		elseif wld == "3" and pbtrp == "Tier4" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(11557.2627, 9.68262386, 100.603821, -0.148446038, 0, 0.98892051, 0, 1, -0, -0.98892051, 0, -0.148446038)
		elseif wld == "3" and pbtrp == "Tier5" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(11555.543, 9.68262386, 91.6215973, -0.0639985129, 0, 0.997950017, 0, 1.00000012, -0, -0.997950017, 0, -0.0639985129)
		elseif wld == "3" and pbtrp == "Tier6" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(11556.1182, 9.68262482, 81.7948227, -0.194788873, 0, 0.980845153, 0, 1, -0, -0.980845273, 0, -0.194788843)
		elseif wld == "3" and pbtrp == "VIP" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(11553.8691, 9.68262386, 73.7705536, 0.131574035, 0, 0.991306245, 0, 0.99999994, -0, -0.991306365, 0, 0.13157402)
		end
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(wld,"Dumbells",dumbtrp)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onClick:FireServer()
		wait(0.01)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(wld,"Grips",griptrp)
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onClick:FireServer()
		wait(0.01)
		if pbtrp == "VIP" then
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PunchBagService.RE.onGiveStats:FireServer(wld,pbtrp,true)
		else
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PunchBagService.RE.onGiveStats:FireServer(wld,pbtrp)
		end
		wait()
	end
end


click:AddToggle({
	Name = "Auto Click",
	Default = false,
	Save = true,
	Flag = "AutoClick",
	Callback = function(Value)
		atoclick(Value)
	end
})

EventStat = eveegg:AddParagraph("Event Statistics",plr.PlayerGui.GameUI.Menus.Event.Amount.Text)
Boss:AddDropdown({
	Name = "Choose Boss",
	Default = "",
	Options = {"RipperDoc","CocoNut"},
	Save = true,
	Flag = "EventBoss",
	Callback = function(Value)
		bossevent = Value
	end
})
Boss:AddToggle({
	Name = "Auto Fight Boss",
	Default = false,
	Save = true,
	Flag = "AutoFarmEventBoss",
	Callback = function(Value)
		atojoinboss(Value)
	end
})

eveegg:AddDropdown({
	Name = "Egg Amount",
	Default = "",
	Options = {"X1","X3","X8"},
	Save = true,
	Flag = "EventEggAmount",
	Callback = function(Value)
		eggchoose = Value
	end
})
eveegg:AddToggle({
	Name = "Auto Open Egg",
	Default = false,
	Callback = function(Value)
		atoopenegg(Value)
	end
})

Poison:AddButton({
	Name = "X2 Win Poison",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Wins")
	end
})
Poison:AddButton({
	Name = "Luck Poison",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Luck")	
	end
})
Poison:AddButton({
	Name = "Golden Poison",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Golden")
	end
})
Poison:AddButton({
	Name = "Void Poison",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Void")
	end
})

rebirth:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Save = true,
	Flag = "AutoRebirth",
	Callback = function(Value)
		aturb(Value)
	end
})
claimgift:AddToggle({
	Name = "Auto Claim Gift",
	Default = false,
	Save = true,
	Flag = "AutoClaimGift",
	Callback = function(Value)
		gift(Value)
	end
})
claimgift:AddToggle({
	Name = "Rejoin When Claim All Gift",
	Default = false,
	Save = true,
	Flag = "RejoinClaimGift",
	Callback = function(Value)
		rjgift(Value)
	end
})
claimdaily:AddToggle({
	Name = "Auto Spin",
	Default = false,
	Save = true,
	Flag = "AutoSpin",
	Callback = function(Value)
		Spin(Value)
	end
})
claimdaily:AddButton({
	Name = "Claim Daily",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.DailyRewardService.RE.onClaimReward:FireServer()
	end
})

tp:AddButton({
	Name = "Teleport World 1",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones:FindFirstChild("1").Interactables.Teleports.Locations.BackToSchool)
	end
})
tp:AddButton({
	Name = "Teleport World 2",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones:FindFirstChild("2").Interactables.Teleports.Locations.Futuristic)
	end
})
tp:AddButton({
	Name = "Teleport World 3",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones:FindFirstChild("3").Interactables.Teleports.Locations.Beach)
	end
})

bttle:AddDropdown({
	Name = "Choose Boss",
	Default = "",
	Options = {"Bully","Teacher","GymRat","MafiaBoss","Champion","ScrapTrader","CyberCop","SlicerAssassin","RipperDoc","RogueAi","CocoNut","FatPirate","MermaidKing","FriendlyShark","KrakenBoss","Barbarian","Hazmat","Enforcer","Bulk","MutantKing"},
	Save = true,
	Flag = "BattleBoss",
	Callback = function(Value)
		bosschoose = Value
	end
})
bttle:AddToggle({
	Name = "Auto Boss Fight",
	Default = false,
	Save = true,
	Flag = "AutoBoss",
	Callback = function(Value)
		atubttboss(Value)
	end
})

lg:AddToggle({
	Name = "Auto League Farm",
	Default = false,
	Callback = function(Value)
		fleague(Value)
	end
})

hatcher:AddToggle({
	Name = "Auto Craft All",
	Default = false,
	Save = true,
	Flag = "AutoCraftAll",
	Callback = function(Value)
		atocraft(Value)
	end
})
hatcher:AddToggle({
	Name = "Invisible Hatch Eggs",
	Default = false,
	Save = true,
	Flag = "InvisibleHatch",
	Callback = function(Value)
		if Value then
			plr.PlayerGui.OpenerUI.EggOpening.Visible = false
		else
			plr.PlayerGui.OpenerUI.EggOpening.Visible = true
		end
	end
})
hatcher:AddDropdown({
	Name = "Choose Egg To Open",
	Default = "",
	Options = {"Earth","Icy","Lava","Blackhole","Crystal","Molton","Solar","Moon","Ice","Burning","Coconut","Palm","Treasure","Clam","KingFish","Poseidon","Rust","Iridescent","Atom","Iridescent","Mutant","Nuclear"},
	Save = true,
	Flag = "OpenEgg",
	Callback = function(Value)
		eggpick = Value
	end
})
hatcher:AddToggle({
	Name = "AutoOpen Egg",
	Default = false,
	Callback = function(Value)
		atoegg(Value)
	end
})

exploiters:AddToggle({
	Name = "Free Gamepass Multi Eggs(Only Work With Event)",
	Default = false,
	Callback = function(Value)
		if Value then
			plr:SetAttribute("TripleEggs", true)
			plr:SetAttribute("OctoEggs", true)
		else
			plr:SetAttribute("TripleEggs", false)
			plr:SetAttribute("OctoEggs", false)
		end
	end
})
triplefarm:AddDropdown({
	Name = "Select World",
	Default = "",
	Options = {"1","2","3","4"},
	Save = true,
	Flag = "trip world",
	Callback = function(Value)
		wld = Value
	end
})
triplefarm:AddDropdown({
	Name = "Select Dumbells KG [Stats 1]",
	Default = "",
	Options = {"1Kg","2Kg","3Kg","4Kg","5Kg","10Kg","15Kg","20Kg","25Kg","50Kg","100Kg","250Kg","300Kg","400Kg","500Kg","650Kg","800Kg","1000Kg","1500Kg","2000Kg","2500Kg","3000Kg","3500Kg","4000Kg","5000Kg","6000Kg","7500Kg","10000Kg","12500Kg","15000Kg","20000Kg","25000Kg","30000Kg","35000Kg","40000Kg","45000Kg","50000","60000","70000","80000","90000","100000","125000","150000","175000","200000","250000","300000"},
	Save = true,
	Flag = "trip dumbells",
	Callback = function(Value)
		dumbtrp = Value
	end
})
triplefarm:AddDropdown({
	Name = "Select Grip KG [Stats 2]",
	Default = "",
	Options = {"1Kg","2Kg","3Kg","4Kg","5Kg","10Kg","15Kg","20Kg","25Kg","50Kg","100Kg","250Kg","300Kg","350Kg","400Kg","450Kg","500Kg","600Kg","700Kg","800Kg","900Kg","1000Kg","1250Kg","1500Kg","5000Kg","6000Kg","7500Kg","10000Kg","12500Kg","15000Kg","20000Kg","25000Kg","30000Kg","35000Kg","40000Kg","45000Kg","50000","60000","70000","80000","90000","100000","125000","150000","175000","200000","250000","300000"},
	Save = true,
	Flag = "trip grip",
	Callback = function(Value)
		griptrp = Value
	end
})
triplefarm:AddDropdown({
	Name = "Select Punching Bag [Stats 3]",
	Default = "",
	Options = {"Tier1","Tier2","Tier3","Tier4","Tier5","Tier6","VIP"},
	Save = true,
	Flag = "trip pb",
	Callback = function(Value)
		pbtrp = Value
	end
})
triplefarm:AddToggle({
	Name = "Enable",
	Default = false,
	Callback = function(Value)
		if wld == "1" then
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones:FindFirstChild("1").Interactables.Teleports.Locations.BackToSchool)
		elseif wld == "2" then
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones:FindFirstChild("2").Interactables.Teleports.Locations.Futuristic)
		elseif wld == "3" then
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones:FindFirstChild("3").Interactables.Teleports.Locations.Beach)
		end
		trpfarm(Value)
	end
})

destroy:AddParagraph("Credit","Script Dev: !BomUwU")
destroy:AddButton({
	Name = "Copy Dev Discord",
	Callback = function()
		setclipboard("https://discord.com/users/272459309227442176")
	end
})
destroy:AddButton({
	Name = "Destroy UI",
	Callback = function()
		OrionLib:Destroy()
	end
})
OrionLib:Init()
local vu = game:GetService("VirtualUser")
plr.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

while wait() do
	EventStat:Set(plr.PlayerGui.GameUI.Menus.Event.Amount.Text)
end
