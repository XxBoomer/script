local player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local TextButton_3 = Instance.new("TextButton")
local TextButton_4 = Instance.new("TextButton")


ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.1, 0, 0.35, 0)
Frame.Size = UDim2.new(0, 200, 0, 300)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 232, 117)
TextLabel.Size = UDim2.new(0, 200, 0, 60)
TextLabel.Font = Enum.Font.AmaticSC
TextLabel.Text = "King Legacy"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 35.000
TextLabel.TextWrapped = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(117, 50, 168)
TextButton.Position = UDim2.new(0, 0, 0.400000006, 0)
TextButton.Size = UDim2.new(0, 200, 0, 60)
TextButton.Font = Enum.Font.AmaticSC
TextButton.Text = "Altsegod"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 40.000
TextButton.TextWrapped = true

function war()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AltsegoD/script/master/KingPiece.lua"))()
    for i,v in pairs(player.PlayerGui:GetChildren()) do
        if v.Name == "ScreenGui" then
            v:Destroy()
        end
    end
end
TextButton.MouseButton1Click:connect(war)

TextButton_2.Parent = Frame
TextButton_2.BackgroundColor3 = Color3.fromRGB(117, 50, 168)
TextButton_2.Position = UDim2.new(0, 0, 0.600000024, 0)
TextButton_2.Size = UDim2.new(0, 200, 0, 60)
TextButton_2.Font = Enum.Font.AmaticSC
TextButton_2.Text = "Sannin"
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 40.000
TextButton_2.TextWrapped = true

function spins()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sannin9000/scripts/main/kinglegacy.lua"))()
    for i,v in pairs(player.PlayerGui:GetChildren()) do
        if v.Name == "ScreenGui" then
            v:Destroy()
        end
    end
end
TextButton_2.MouseButton1Click:connect(spins)
