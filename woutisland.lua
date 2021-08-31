while true do
game:GetService("ReplicatedStorage").Remotes.LiftWeight:FireServer()
local args = {
    [1] = "Weight"
}
game:GetService("ReplicatedStorage").Remotes.Shop.RequestBuyAll:InvokeServer(unpack(args))
end
