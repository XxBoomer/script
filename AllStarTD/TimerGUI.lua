repeat wait() until game:IsLoaded()
print('Game Is Loaded')
for _,v in pairs(game:GetService('CoreGui'):GetDescendants()) do
    if v:IsA('IntValue') and v.Name == 'bulon_anhdausss' then
        v.Parent:Destroy()
    end
end

local Heartbeat = game:GetService("RunService").Heartbeat;
local UIS = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");

local dragger = {};

do
	local mouse        = game:GetService("Players").LocalPlayer:GetMouse();
	local inputService = game:GetService('UserInputService');
	local heartbeat    = game:GetService("RunService").Heartbeat;

	-- // credits to Ririchi / Inori for this cute drag function :)
	function dragger.new(frame, secondlol)
		frame.Active = true;
		secondlol.Active = true;

		secondlol.MouseLeave:connect(function()
			IsInFrame = false;
		end)

		secondlol.MouseEnter:connect(function()
			IsInFrame = true;
		end)

		local input = secondlol.InputBegan:connect(function(key)
			if key.UserInputType == Enum.UserInputType.MouseButton1 and IsInFrame then
				local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
				while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
					pcall(function()
						frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Linear', 0.01, true);
					end)
				end
			end
		end)
	end
end
local timer = 0
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = game:GetService("HttpService"):GenerateGUID(false):lower():sub(1, 10);
local toggled  = false
game:GetService('UserInputService').InputBegan:connect(function(key, gpe)
        --if (not gpe) then
            if key.KeyCode == Enum.KeyCode.RightShift and ScreenGui then
                toggled = not toggled;
                ScreenGui.Enabled = toggled
            end
        --end
    end)

local intvalue = Instance.new('IntValue')
intvalue.Parent = ScreenGui
intvalue.Name = 'bulon_anhdau'

Frame.Name = "Frame"
Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0)
Frame.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.5, 0, 0, -25)
Frame.Size = UDim2.new(0, 150, 0, 25)
Frame.Image = "rbxassetid://3570695787"
Frame.ImageColor3 = Color3.fromRGB(47, 47, 47)
Frame.ScaleType = Enum.ScaleType.Slice
Frame.SliceCenter = Rect.new(100, 100, 100, 100)
Frame.SliceScale = 0.050

dragger.new(Frame,Frame)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.Text = '-_-'

function Concu(Int)
	return string.format("%02i", Int)
end


function Concac(Time)
	Minutes = (Time - Time%60)/60
	Time = Time - Minutes*60
	Hours = (Minutes - Minutes%60)/60
	Minutes = Minutes - Hours*60
	Days = (Hours - Hours%24)/24
	Hours = Hours - Days*24
	return Concu(Days)..'d '..Concu(Hours)..'h '..Concu(Minutes)..'m '..Concu(Time)..'s'

end

while true do 
timer++
TextLabel.Text = Concac(timer)
wait(1)
end

wait()
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
print('anti afk run')
