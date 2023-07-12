local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Arm Wrestling Simulator ", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Main1 = Main:AddSection({
	Name = "Main"
})
local Boss = Main:AddSection({
	Name = "Boss"
})
local Egg = Main:AddSection({
	Name = "Egg"
})
local Poison = Main:AddSection({
	Name = "Poison"
})

local Stuff = Window:MakeTab({
	Name = "Stuff",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local rebirth = Stuff:AddSection({
	Name = "Auto Rebirth"
})
local claimgift = Stuff:AddSection({
	Name = "Claim Gift"
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
		wait(5)
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
		if bosschoose == "RipperDoc" then 
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("RipperDoc",workspace.Zones["2"].Interactables.ArmWrestling.NPC.RipperDoc,"2")
		elseif bosschoose == "CocoNut" then 
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("CocoNut",workspace.Zones["3"].Interactables.ArmWrestling.NPC.CocoNut,"3")
		end
		wait(1) 
	end
end
local function atoopenegg(openegg)
	_G.openegg = openegg
	while _G.openegg do 
		if eggchoose == "1" then 
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EventService.RF.ClaimEgg:InvokeServer()
		elseif eggchoose == "3" then 
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EventService.RF.ClaimEgg:InvokeServer(3)
		end
		wait(1)
	end
end

Main1:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
		atoclick(Value)
	end
})


Boss:AddDropdown({
	Name = "Choose Boss",
	Default = "",
	Options = {"RipperDoc","CocoNut"},
	Callback = function(Value)
		bosschoose = Value
	end
})
	
Boss:AddToggle({
	Name = "Auto Join Boss",
	Default = false,
	Callback = function(Value)
		atojoinboss(Value)
	end
})	

Egg:AddDropdown({
	Name = "Egg Amount",
	Default = "",
	Options = {"1","3"},
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
	Callback = function(Value)
		aturb(Value)
	end
})
claimgift:AddToggle({
	Name = "Auto Claim Gift",
	Default = false,
	Callback = function(Value)
		gift(Value)
	end
})

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
