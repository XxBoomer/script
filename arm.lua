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

local Event = Window:MakeTab({
	Name = "Event",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Boss = Event:AddSection({
	Name = "Boss"
})
local Egg = Event:AddSection({
	Name = "Egg"
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
		wait(1) 
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

click:AddToggle({
	Name = "Auto Click",
	Default = false,
	Save = true,
	Flag = "AutoClick",
	Callback = function(Value)
		atoclick(Value)
	end
})

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
	Name = "Auto Join Boss",
	Default = false,
	Save = true,
	Flag = "AutoFarmEventBoss",
	Callback = function(Value)
		atojoinboss(Value)
	end
})

Egg:AddDropdown({
	Name = "Egg Amount",
	Default = "",
	Options = {"X1","X3","X8"},
	Save = true,
	Flag = "EventEggAmount",
	Callback = function(Value)
		eggchoose = Value
	end
})
Egg:AddToggle({
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
			game:GetService("Players").LocalPlayer.PlayerGui.OpenerUI.EggOpening.Visible = false
		else
			game:GetService("Players").LocalPlayer.PlayerGui.OpenerUI.EggOpening.Visible = true
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
destroy:AddLabel("Script Make By XxBoomer")
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
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
