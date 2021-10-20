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
TextLabel.Text = "Blox Fruit Script"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 35.000
TextLabel.TextWrapped = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(117, 50, 168)
TextButton.Position = UDim2.new(0, 0, 0.400000006, 0)
TextButton.Size = UDim2.new(0, 200, 0, 60)
TextButton.Font = Enum.Font.AmaticSC
TextButton.Text = "RelaxHub"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 40.000
TextButton.TextWrapped = true

function war()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/XxBoomer/script/main/BloxFruit/relaxhub.lua'))();
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
TextButton_2.Text = "Strike"
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 40.000
TextButton_2.TextWrapped = true

function spins()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/StormSKz12/StirkeHub1/main/Gameincluded"))()
    for i,v in pairs(player.PlayerGui:GetChildren()) do
        if v.Name == "ScreenGui" then
            v:Destroy()
        end
    end
end
TextButton_2.MouseButton1Click:connect(spins)

TextButton_3.Parent = Frame
TextButton_3.BackgroundColor3 = Color3.fromRGB(117, 50, 168)
TextButton_3.Position = UDim2.new(0, 0, 0.800000012, 0)
TextButton_3.Size = UDim2.new(0, 200, 0, 60)
TextButton_3.Font = Enum.Font.AmaticSC
TextButton_3.Text = "Mammoz"
TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.TextScaled = true
TextButton_3.TextSize = 40.000
TextButton_3.TextWrapped = true

function utility()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/toeydeklnw/HUB-obfuscator/main/mammoz.lua"))()
    for i,v in pairs(player.PlayerGui:GetChildren()) do
        if v.Name == "ScreenGui" then
            v:Destroy()
        end
    end
end
TextButton_3.MouseButton1Click:connect(utility)

TextButton_4.Parent = Frame
TextButton_4.BackgroundColor3 = Color3.fromRGB(117, 50, 168)
TextButton_4.Position = UDim2.new(0, 0, 0.200000003, 0)
TextButton_4.Size = UDim2.new(0, 200, 0, 60)
TextButton_4.Font = Enum.Font.AmaticSC
TextButton_4.Text = "rasputin"
TextButton_4.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_4.TextScaled = true
TextButton_4.TextSize = 14.000
TextButton_4.TextWrapped = true

function autofarm()
    loadstring(game:HttpGet("https://rasputin-bf.glitch.me/bloxfruits.lua"))()
    for i,v in pairs(player.PlayerGui:GetChildren()) do
        if v.Name == "ScreenGui" then
            v:Destroy()
        end
    end
end
TextButton_4.MouseButton1Click:connect(autofarm)
