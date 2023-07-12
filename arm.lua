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
		elseif bosschose == "CocoNut" then 
			game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("CocoNut",workspace.Zones["3"].Interactables.ArmWrestling.NPC.CocoNut,"3")
		end 
		wait(5) 
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
		wait(5) 
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
	Options = {"RipperDoc", "CocoNut"},
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
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
