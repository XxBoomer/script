repeat wait() until game:IsLoaded()
_G.webhook = "https://discord.com/api/webhooks/850428483803807794/EEC5vUENwgh2fdBJFLpfW74-taL3DDf517vDwjYEjLVy7z82pt5irtbivHICZ96MbDw6"
ostime = os.time()
thoigianbatdau = os.date('%d/%m/%Y %H:%M:%S')
getgenv().logg = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
time1 = os.time() - ostime
if time1 < 60 then
  time2 = tostring( string.format("%.2f",tostring(time1))).."giây"
elseif time1 >= 60 and time1 <=3600 then
  time2 = tostring( string.format("%.2f",tostring(time1/60 ))).."phút"
elseif time1 >= 3600 then
  time2 = tostring(   string.format("%.2f",tostring(time1/3600))).."giờ"
end

syn.request(
        {
            Url = _G.webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode({["content"] ="Name: "..game.Players.LocalPlayer.Name.."\nGem: "..tostring(game:GetService("Players").LocalPlayer.GemsCollected.Value).."\nCoin: "..tostring(game:GetService("Players").LocalPlayer.GemsCollected.Value).."\nThời gian bắt đầu: "..tostring(thoigianbatdau).."\nThời gian kết thúc: "..os.date('%d/%m/%Y %H:%M:%S').."\nÐã treo được trong: "..time2.."\nKhách vào acc hoặc lost connection"})
        }
    )       end
end)
print('executed')
