while true do
game:GetService("ReplicatedStorage").Remotes.LiftWeight:FireServer()
local args = {
    [1] = "Weight"
}
game:GetService("ReplicatedStorage").Remotes.Shop.RequestBuyAll:InvokeServer(unpack(args))
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-18.862257, 165.901932, 128.642166, 0.356824696, 6.62893171e-08, 0.934171379, -4.86318399e-08, 1, -5.23846921e-08, -0.934171379, -2.673832e-08, 0.356824696)
wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21.8789978, 165.901917, 111.085205, 0.995813251, -7.25785512e-08, 0.0914109796, 6.94480136e-08, 1, 3.74276645e-08, -0.0914109796, -3.09226564e-08, 0.995813251)
wait(0.4)
end
