repeat
    wait()
until game:IsLoaded()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local TeleportService = game:GetService("TeleportService")
local Player = Players.LocalPlayer
local TOTAL_TIME = 365 -- seconds

local ListGame = {
    ["6216468795"] = "a30565cbe5aaa1e8766db3e2b2c4d5bd", -- WEAK LEGACY 2
	["8950496606"] = "794fd9f853127d654c96f765187d2c5a", -- Deadly Delivery
	["7671049560"] = "13439806236429772b7cd5f1248dbd6c", -- The Forge [BETA]
}

local script_id = ListGame[tostring(game.GameId)]

if not script_id then
    Player:Kick("L4BIB HUB: Game not supported.")
    return
end

-- === YOUR EXACT UI (FULLY RESTORED & FIXED) ===
local KeySystem = Instance.new("ScreenGui")
KeySystem.Name = "L4BIB HUB KEY SYSTEM"
KeySystem.ResetOnSpawn = false
KeySystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if syn and syn.protect_gui then
    syn.protect_gui(KeySystem)
end
KeySystem.Parent = CoreGui

local Main = Instance.new("CanvasGroup")
Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0.332713664, 0, 0.367715359, 0)
Main.GroupTransparency = 0
Main.Parent = KeySystem

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.05, 0)
UICorner.Parent = Main

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(170, 0, 255)
UIStroke.Thickness = 4
UIStroke.Parent = Main

local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint.AspectRatio = 1.6072998046875
UIAspectRatioConstraint.Parent = Main

-- Title
local Title = Instance.new("TextLabel")
Title.Font = Enum.Font.FredokaOne
Title.Text = "L4BIB HUB"
Title.TextColor3 = Color3.fromRGB(169, 71, 255)
Title.TextScaled = true
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0.13407062, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Parent = Main

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color =
    ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(191, 191, 191)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
TitleGradient.Rotation = -90
TitleGradient.Parent = Title

-- Close Button (Fixed Position)
local Close = Instance.new("TextButton")
Close.Name = "Close"
Close.Font = Enum.Font.FredokaOne
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.BackgroundTransparency = 1
Close.Size = UDim2.new(0.151188597, 0, 0.13407062, 0)
Close.Position = UDim2.new(0.8488114, 0, 0, 0) -- Fixed correct position
Close.Parent = Main

-- Bar
local Bar = Instance.new("Frame")
Bar.Name = "Bar"
Bar.AnchorPoint = Vector2.new(0.5, 0.5)
Bar.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
Bar.BorderSizePixel = 0
Bar.Size = UDim2.new(0.75, 0, 0.01, 0)
Bar.Position = UDim2.new(0.5, 0, 0.15, 0)
Bar.Parent = Main

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1, 0)
BarCorner.Parent = Bar

-- KEY SYSTEM Text
local KeyText = Instance.new("TextLabel")
KeyText.Name = "Text"
KeyText.Font = Enum.Font.FredokaOne
KeyText.Text = "KEY SYSTEM"
KeyText.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyText.TextScaled = true
KeyText.BackgroundTransparency = 1
KeyText.Size = UDim2.new(1, 0, 0.0986209661, 0)
KeyText.Position = UDim2.new(0, 0, 0.192440808, 0)
KeyText.Parent = Main

-- Key Input
local KeyBox = Instance.new("TextBox")
KeyBox.Name = "Key"
KeyBox.AnchorPoint = Vector2.new(0.5, 0.5)
KeyBox.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
KeyBox.BorderSizePixel = 0
KeyBox.PlaceholderText = "Key Here"
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Font = Enum.Font.SourceSansBold
KeyBox.TextSize = 18
KeyBox.Size = UDim2.new(0.800000072, 0, 0.130385414, 0)
KeyBox.Position = UDim2.new(0.5, 0, 0.388586462, 0)
KeyBox.Parent = Main
KeyBox.TextScaled = true

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0.2, 0)
KeyCorner.Parent = KeyBox

-- Submit Button
local Submit = Instance.new("ImageButton")
Submit.Name = "Submit"
Submit.AnchorPoint = Vector2.new(0.5, 0.5)
Submit.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
Submit.BorderSizePixel = 0
Submit.Size = UDim2.new(0.80000025, 0, 0.130385429, 0)
Submit.Position = UDim2.new(0.5, 0, 0.555706501, 0)
Submit.Parent = Main

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0.2, 0)
SubmitCorner.Parent = Submit

local SubmitLabel = Instance.new("TextLabel")
SubmitLabel.Font = Enum.Font.SourceSansBold
SubmitLabel.Text = "Submit"
SubmitLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitLabel.TextScaled = true
SubmitLabel.BackgroundTransparency = 1
SubmitLabel.AnchorPoint = Vector2.new(0.5, 0.5)
SubmitLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
SubmitLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
SubmitLabel.Parent = Submit

local SubmitGradient = Instance.new("UIGradient")
SubmitGradient.Rotation = -90
SubmitGradient.Color =
    ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(186, 186, 186)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(243, 243, 243)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
SubmitGradient.Parent = Submit

-- Work Ink Button
local Work = Instance.new("ImageButton")
Work.Name = "Work"
Work.AnchorPoint = Vector2.new(0.5, 0.5)
Work.BackgroundColor3 = Color3.fromRGB(16, 198, 31)
Work.Size = UDim2.new(0.377796799, 0, 0.135449663, 0)
Work.Position = UDim2.new(0.288898021, 0, 0.725358367, 0)
Work.Parent = Main

local WorkGrad = Instance.new("UIGradient", Work)
WorkGrad.Color =
    ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(186, 186, 186)),
    ColorSequenceKeypoint.new(0.52, Color3.fromRGB(243, 243, 243)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
WorkGrad.Rotation = -90

local WorkCorner = Instance.new("UICorner")
WorkCorner.CornerRadius = UDim.new(0.2, 0)
WorkCorner.Parent = Work

local WorkLabel = Instance.new("TextLabel")
WorkLabel.Font = Enum.Font.SourceSansBold
WorkLabel.Text = "Work Ink"
WorkLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WorkLabel.TextScaled = true
WorkLabel.BackgroundTransparency = 1
WorkLabel.AnchorPoint = Vector2.new(0.5, 0.5)
WorkLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
WorkLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
WorkLabel.Parent = Work

-- Linkvertise Button
local Link = Instance.new("ImageButton")
Link.Name = "Link"
Link.AnchorPoint = Vector2.new(0.5, 0.5)
Link.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
Link.Size = UDim2.new(0.377796799, 0, 0.135449663, 0)
Link.Position = UDim2.new(0.711101234, 0, 0.725358367, 0)
Link.Parent = Main
local LinkGrad = Instance.new("UIGradient", Link)
LinkGrad.Color =
    ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(186, 186, 186)),
    ColorSequenceKeypoint.new(0.52, Color3.fromRGB(243, 243, 243)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}

LinkGrad.Rotation = -90

local LinkCorner = Instance.new("UICorner")
LinkCorner.CornerRadius = UDim.new(0.2, 0)
LinkCorner.Parent = Link

local LinkLabel = Instance.new("TextLabel")
LinkLabel.Font = Enum.Font.SourceSansBold
LinkLabel.Text = "Linkvertise"
LinkLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LinkLabel.TextScaled = true
LinkLabel.BackgroundTransparency = 1
LinkLabel.AnchorPoint = Vector2.new(0.5, 0.5)
LinkLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
LinkLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
LinkLabel.Parent = Link

-- Discord Button
local Discord = Instance.new("ImageButton")
Discord.Name = "Discord"
Discord.AnchorPoint = Vector2.new(0.5, 0.5)
Discord.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
Discord.Size = UDim2.new(0.80000025, 0, 0.130385429, 0)
Discord.Position = UDim2.new(0.5, 0, 0.884614468, 0)
Discord.Parent = Main

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0.2, 0)
DiscordCorner.Parent = Discord

local DiscordLabel = Instance.new("TextLabel")
DiscordLabel.Font = Enum.Font.SourceSansBold
DiscordLabel.Text = "Discord"
DiscordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordLabel.TextScaled = true
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.AnchorPoint = Vector2.new(0.5, 0.5)
DiscordLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
DiscordLabel.Size = UDim2.new(0.8, 0, 0.8, 0)
DiscordLabel.Parent = Discord

-- UI
local gui = Instance.new("ScreenGui")
gui.Name = "CountdownUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromScale(0.25, 0.1)
frame.Position = UDim2.fromScale(0.375, 0.05)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.1
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.fromScale(1, 1)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Font = Enum.Font.GothamBold
label.TextScaled = true
label.Parent = frame

-- Dragging
local dragging = false
local dragStart, startPos
Main.InputBegan:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
        end
    end
)

Main.InputChanged:Connect(
    function(input)
        if
            dragging and
                (input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch)
         then
            local delta = input.Position - dragStart
            Main.Position =
                UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end
)

UserInputService.InputEnded:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end
)

-- Notification System
local NotifyContainer = Instance.new("Frame")
NotifyContainer.Name = "Notifications"
NotifyContainer.BackgroundTransparency = 1
NotifyContainer.Size = UDim2.new(0, 360, 1, 0)
NotifyContainer.Position = UDim2.new(1, -370, 0, 10)
NotifyContainer.Parent = KeySystem

local NotifyLayout = Instance.new("UIListLayout")
NotifyLayout.Padding = UDim.new(0, 8)
NotifyLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifyLayout.Parent = NotifyContainer

local function Notify(title, text, duration)
    duration = duration or 5
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(1, 0, 0, 70)
    notif.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    notif.BorderSizePixel = 0
    notif.Parent = NotifyContainer

    Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", notif)
    stroke.Color = Color3.fromRGB(170, 0, 255)
    stroke.Thickness = 2

    local t = Instance.new("TextLabel", notif)
    t.Text = title
    t.Font = Enum.Font.FredokaOne
    t.TextColor3 = Color3.fromRGB(170, 0, 255)
    t.TextSize = 18
    t.Position = UDim2.fromOffset(10, 5)
    t.BackgroundTransparency = 1
    t.TextXAlignment = Enum.TextXAlignment.Left

    local d = Instance.new("TextLabel", notif)
    d.Text = text
    d.Font = Enum.Font.SourceSans
    d.TextColor3 = Color3.fromRGB(220, 220, 220)
    d.TextSize = 14
    d.Position = UDim2.fromOffset(10, 28)
    d.Size = UDim2.new(1, -20, 0, 30)
    d.BackgroundTransparency = 1
    d.TextWrapped = true
    d.TextXAlignment = Enum.TextXAlignment.Left

    local bar = Instance.new("Frame", notif)
    bar.Size = UDim2.new(1, -16, 0, 4)
    bar.Position = UDim2.new(0, 8, 1, -8)
    bar.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
    TweenService:Create(bar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 0, 4)}):Play()
    task.delay(
        duration + 0.5,
        function()
            notif:Destroy()
        end
    )
end

-- Load Luarmor
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = script_id

local function VerifyKey(key)
    local status = api.check_key(script_key or key)

    if (status.code == "KEY_VALID") then
        makefolder("L4BIB HUB")
        writefile("L4BIB HUB/key.txt", key)

        Notify("Success", "Key accepted! Loading script...")

        task.wait(2)

		script_key = script_key or key

        local tween =
            TweenService:Create(
            Main,
            TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In),
            {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.fromScale(0.5, -0.5)}
        )
        tween:Play()
        tween.Completed:Wait()
        KeySystem:Destroy()

        api.load_script()
        return
    elseif (status.code == "KEY_HWID_LOCKED") then
        Notify("Failed", status.message or "hwid does not match and needs to be reset via bot panel or ad page.")
        return
    elseif (status.code == "KEY_INCORRECT") then
        Notify("Failed", status.message or "Invalid or expired key")
        return
    else
        Player:Kick("Key check failed:" .. status.message .. " Code: " .. status.code)
    end
end

if script_key then
	VerifyKey(script_key)
end

-- Auto-load saved key
task.spawn(
    function()
        if isfile("L4BIB HUB/key.txt") then
            local key = readfile("L4BIB HUB/key.txt")
            if VerifyKey(key) then
                return
            end
        end
    end
)

-- Events
Close.MouseButton1Click:Connect(
    function()
        local tween =
            TweenService:Create(
            Main,
            TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In),
            {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.fromScale(0.5, -0.5)}
        )
        tween:Play()
        tween.Completed:Wait()
        KeySystem:Destroy()
    end
)

Submit.MouseButton1Click:Connect(
    function()
        VerifyKey(KeyBox.Text)
    end
)

KeyBox.FocusLost:Connect(
    function(enter)
        if enter then
            VerifyKey(KeyBox.Text)
        end
    end
)

-- Time format mm:ss
local function formatTime(seconds)
	local m = math.floor(seconds / 60)
	local s = seconds % 60
	return string.format("%d:%02d", m, s)
end

-- Countdown
for t = TOTAL_TIME, 0, -1 do
	label.Text = "Rejoining in: " .. formatTime(t)
	task.wait(1)
end

label.Text = "Rejoining..."

-- Teleport
wait(1)
TeleportService:Teleport(game.PlaceId, player)

-- Change these links!
local WORK_INK = "https://ads.luarmor.net/get_key?for=L4BIB_HUB_WORKINK-EpvokBgEvTci"
local LINKVERTISE = "https://ads.luarmor.net/get_key?for=L4BIB_HUB_LINKVERTISE-aWCZThazuDpE"
local DISCORD_INVITE = "https://discord.gg/dPtFfx8Sjx"

local clip = setclipboard or toclipboard
Work.MouseButton1Click:Connect(
    function()
        clip(WORK_INK)
        Notify("Copied", "Work Ink link copied!")
    end
)
Link.MouseButton1Click:Connect(
    function()
        clip(LINKVERTISE)
        Notify("Copied", "Linkvertise link copied!")
    end
)
Discord.MouseButton1Click:Connect(
    function()
        clip(DISCORD_INVITE)
        Notify("Copied", "Discord copied!")
    end
)
