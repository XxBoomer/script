local Engine = {}

local __SERVICES = {}
local __GAME = {}
local __NETWORK = {}
local __PLAZA = {}
local __FARMING = {}
local __LOCAL = {}
local __LIBRARY, __CLIENT

function Engine:Init()
    repeat task.wait() until game:IsLoaded()

    __SERVICES.RS = game:GetService("ReplicatedStorage")
    __SERVICES.TP = game:GetService("TeleportService")
    __SERVICES.HTTP = game:GetService("HttpService")
    __SERVICES.RunService = game:GetService("RunService")
    __SERVICES.Players = game:GetService("Players")

    __SERVICES.EventBus = loadstring(game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/ps/eventbus.luau"))()
    __SERVICES.RenderEvent = __SERVICES.EventBus:Create("render", __SERVICES.RunService.RenderStepped)

    __GAME.LocalPlayer = __SERVICES.Players.LocalPlayer

    __GAME.LibraryModule = __SERVICES.RS:WaitForChild("Library", 10)
    __GAME.ClientModule = __GAME.LibraryModule:WaitForChild("Client", 10)
    __LIBRARY = require(__GAME.LibraryModule)
    __CLIENT = require(__GAME.ClientModule)
    repeat task.wait() until __CLIENT.Loaded

    __NETWORK = __CLIENT.Network
    __GAME.Directory = __LIBRARY.Directory
    __GAME.Scripts = __GAME.LocalPlayer.PlayerScripts.Scripts
    __GAME.GUI = __GAME.LocalPlayer.PlayerGui

    self:InitPatch()
    self:InitMisc()
    self:InitFunctions()

    self.__SERVICES = __SERVICES
    self.__GAME = __GAME
    self.__NETWORK = __NETWORK
    self.__PLAZA = __PLAZA
    self.__LIBRARY = __LIBRARY
    self.__CLIENT = __CLIENT
    self.__LOCAL = __LOCAL
    self.__FARMING = __FARMING
end

function Engine:InitPatch()
    if getgenv().Patched then return end
    getgenv().Patched = true

    local Blunder = require(__SERVICES.RS:FindFirstChild("BlunderList", true))
    local OldGet = Blunder.getAndClear
    setreadonly(Blunder, false)

    Blunder.getAndClear = function(...)
        local Packet = ...
        for i,v in next, Packet.list do
            if v.message ~= "PING" then
                table.remove(Packet.list, i)
            end
        end
        return OldGet(Packet)
    end

    hookfunction(__LIBRARY.Audio.Play, function(...)
        return {
            Play = function() end,
            Stop = function() end,
            IsPlaying = function() return false end
        }
    end)

    for _,f in pairs(__CLIENT.WorldFX.Fireworks) do
        hookfunction(f, function(...) end)
    end
end

function Engine:InitMisc()
    if getgenv().EngineOpts_Optimization then
        local signal = __LIBRARY.Debris.ChildAdded
        signal:Connect(function(child)
            signal:Wait()
            child:Remove()
        end)

        local lighting = game:GetService("Lighting")
        lighting.GlobalShadows = false
        lighting.FogStart = 0
        lighting.FogEnd = 0
        lighting.Brightness = 0
        settings().Rendering.QualityLevel = "Level01"

        local function optTexture(v)
            if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            elseif v:IsA("MeshPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            end
        end

        for _,v in pairs(game:GetDescendants()) do
            pcall(optTexture, v)
        end

        game.DescendantAdded:Connect(function(v)
            game.DescendantAdded:Wait()
            pcall(v)
        end)

        for _,e in pairs(lighting:GetChildren()) do
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                e.Enabled = false
            end
        end
    end

    if getgenv().EngineOpts_AntiAFK then
        if __GAME.Scripts.Core:FindFirstChild("Idle Tracking") then
            __GAME.Scripts.Core["Idle Tracking"].Enabled = false
        end

        for _,v in pairs(getconnections(__GAME.LocalPlayer.Idled)) do
            if v["Disable"] then v["Disable"](v)
            elseif v["Disconnect"] then v["Disconnect"](v) end
        end
    end

    if getgenv().EngineOpts_DisableRendering then
        local ScreenGui = Instance.new("ScreenGui")
        local FarmGUI = Instance.new("ImageButton")
        local ModeUI = Instance.new("TextLabel")
        local TrackUI = Instance.new("TextLabel")

        ScreenGui.Parent = gethui()
        ScreenGui.IgnoreGuiInset = true

        FarmGUI.Name = "FarmGUI"
        FarmGUI.Parent = ScreenGui
        FarmGUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        FarmGUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
        FarmGUI.BorderSizePixel = 0
        FarmGUI.Size = UDim2.new(1, 0, 1, 0)
        FarmGUI.AutoButtonColor = false
        FarmGUI.ImageColor3 = Color3.fromRGB(0, 0, 0)

        ModeUI.Name = "ModeUI"
        ModeUI.Parent = FarmGUI
        ModeUI.AnchorPoint = Vector2.new(0.5, 0.5)
        ModeUI.BackgroundTransparency = 1
        ModeUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ModeUI.BorderSizePixel = 0
        ModeUI.Position = UDim2.new(0.5, 0, 0.2, 0)
        ModeUI.Size = UDim2.new(1, 0, 0.15, 0)
        ModeUI.Font = Enum.Font.Michroma
        ModeUI.TextSize = 100
        ModeUI.TextWrapped = true

        TrackUI.Name = "TrackUI"
        TrackUI.Parent = FarmGUI
        TrackUI.AnchorPoint = Vector2.new(0.5, 0.5)
        TrackUI.BackgroundTransparency = 1
        TrackUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TrackUI.BorderSizePixel = 0
        TrackUI.Position = UDim2.new(0.5, 0, 0.5, 0)
        TrackUI.Size = UDim2.new(1, 0, 0.5, 0)
        TrackUI.Font = Enum.Font.Michroma
        TrackUI.TextSize = 56
        TrackUI.TextWrapped = true
        TrackUI.RichText = true

        getgenv().Rendering = true

        local function ToggleRendering()
            getgenv().Rendering = not getgenv().Rendering
            FarmGUI.Transparency = getgenv().Rendering and 1 or 0
            __SERVICES.RunService:Set3dRenderingEnabled(getgenv().Rendering)
            ModeUI.Visible = not getgenv().Rendering
            TrackUI.Visible = not getgenv().Rendering
        end

        FarmGUI.MouseButton1Click:Connect(ToggleRendering)
        ToggleRendering()

        coroutine.wrap(function()
            while task.wait() do
                ModeUI.Text = __TRACKER.ModeText
                ModeUI.TextColor3 = __TRACKER.ModeColor
                TrackUI.Text = __TRACKER.TrackText
                TrackUI.TextColor3 = __TRACKER.TrackColor
            end
        end)()
    end
end

function Engine:InitFunctions()
    -- // Table functions
    setreadonly(table, false)

    table.filter = function(t: table, pred: (any, any) -> boolean): table
        local result = {}
        for k,v in pairs(t) do
            if pred(k, v) then result[k] = v end
        end
        return result
    end

    table.iterableFilter = function(t: table, pred: (any, any) -> boolean): table
        return table.iterable(table.filter(t, pred))
    end

    table.map = function(t: table, pred: (any, any) -> any): table
        local result = {}
        for k,v in pairs(t) do
            result[k] = pred(k, v)
        end
        return result
    end

    table.sorted = function(t: table, pred: (any, any) -> boolean): table
        table.sort(t, pred)
        return t
    end

    table.keys = function(t: table): table
        local keys = {}
        for k,_ in pairs(t) do
            table.insert(keys, k)
        end
        return keys
    end

    table.values = function(t: table): table
        local values = {}
        for _,v in pairs(t) do
            table.insert(values, v)
        end
        return values
    end

    table.iterable = function(t: table, pred: (any, any) -> boolean): table
        local result = {}
        for k,v in pairs(t) do
            table.insert(result, pred and pred(k, v) or v)
        end
        return result
    end

    -- // Additional Network functions
    function __NETWORK:InitFunctions()
        self.REvents = {}
        self.RFunctions = {}
        for _,v in pairs(__SERVICES.RS.Network:GetChildren()) do
            if v:IsA("RemoteEvent") then
                table.insert(self.REvents, v.Name)
            elseif v:IsA("RemoteFunction") then
                table.insert(self.RFunctions, v.Name)
            end
        end

        function self.SecuredFire(remote: string, ...: any)
            local success, err
            if table.find(self.REvents, remote) then
                success, err = pcall(self.Fire, remote, ...)
            else
                success, err = false, "Invalid RemoteEvent name"
            end

            return success, err
        end

        function self.SecuredInvoke(remote: string, ...: any)
            local success, err
            if table.find(self.RFunctions, remote) then
                success, err = pcall(self.Invoke, remote, ...)
            else
                success, err = false, "Invalid RemoteFunction name"
            end

            return success, err
        end

        function self.SecuredCall(...: () -> any)
            for _,f in pairs({...}) do
                local success, err = pcall(f)
                if not success then
                    print("[Engine] Function invocation failed: " .. err)
                end
            end
        end
    end

    __NETWORK:InitFunctions()

    function __LOCAL:InitFunctions()
        self.LockedPosition = nil
        self.LockedPositionMag = 0

        function self.HRP()
            return __GAME.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        end

        function self.TeleportCFrame(cframe: CFrame, lookOffset: number)
            self.HRP().CFrame = cframe
            self.HRP().CFrame = self.HRP().CFrame + (self.HRP().CFrame.LookVector * (lookOffset or 0))
        end

        function self.SetLockedPosition(cframe: CFrame, maxMag: number)
            self.LockedPosition = type(cframe) == "vector" and CFrame.new(cframe) or cframe
            self.LockedPositionMag = math.max(maxMag or 0, 0)
        end

        __SERVICES.EventBus:Register("render", 1, 0, function()
            if self.LockedPosition == nil then return end
            if (self.HRP().Position - self.LockedPosition.Position).magnitude > self.LockedPositionMag then
                self.TeleportCFrame(self.LockedPosition)
            end
        end)

        if getgenv().EngineOpts_ServerHop then
            self.ServerHop = {
                FILE = string.format("Engine99/HOP_%s.json", __GAME.LocalPlayer.UserId),
                servers = {},
                CheckedServers = {},
                LastTimeHop = nil,
                Cursor = nil,
                Hops = 0
            }

            if isfile(self.ServerHop.FILE) then
                local fileContent = readfile(self.ServerHop.FILE)
                self.ServerHop = __SERVICES.HTTP:JSONDecode(fileContent)
                if self.ServerHop.Hops % 10 == 0 then
                    self.ServerHop.Cursor = nil
                    self.ServerHop.CheckedServers = {}
                    writefile(self.ServerHop.FILE, __SERVICES.HTTP:JSONEncode(self.ServerHop))
                end
            end

            function self.ServerHop.FetchServers()
                local function GetServerList(cursor)
                    cursor = cursor and "&cursor=" .. cursor or ""
                    local API_URL = string.format('https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=%s&limit=100', tostring(game.PlaceId), "desc")
                    return __SERVICES.HTTP:JSONDecode(game:HttpGet(API_URL .. cursor))
                end

                while true do
                    local serverList
                    repeat
                        serverList = GetServerList(self.ServerHop.Cursor)
                        task.wait(1)
                    until serverList ~= nil

                    self.ServerHop.Cursor = serverList.nextPageCursor

                    for _, server in ipairs(serverList.data) do
                        if server.playing and tonumber(server.playing) >= (getgenv().EngineOpts_ServerHop_MinPlayers or 1)
                        and tonumber(server.playing) < __SERVICES.Players.MaxPlayers
                        and not table.find(self.ServerHop.CheckedServers, tostring(server.id)) then
                            table.insert(self.ServerHop.CheckedServers, server.id)
                            writefile(self.ServerHop.FILE, __SERVICES.HTTP:JSONEncode(self.ServerHop))
                            table.insert(self.ServerHop.servers, server.id)
                            if #self.ServerHop.servers > 200 then break end
                        end
                    end

                    if #self.ServerHop.servers > 200 then break end
                end
            end

            function self.ServerHop.Hop()
                while task.wait(.5) do
                    local servers = self.ServerHop.servers
                    if #servers > 0 then
                        __SERVICES.TP:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], __GAME.LocalPlayer)
                    end
                end
            end

            coroutine.wrap(function()
                __NETWORK.SecuredCall(self.ServerHop.FetchServers)
            end)()
        end
    end

    __LOCAL:InitFunctions()

    function __GAME:InitFunctions()
        self.UPGRADES = {}
        self.MAXZONE = 0
        -- magic.
        self.ZONES = debug.getupvalues(__CLIENT.ZoneCmds.GetMaximumZone)[2].Zones
        self.ZONE_PRICES = debug.getupvalues(debug.getupvalues(__LIBRARY.Balancing.CalcGatePrice)[1].fInv)[2]

        for _,z in pairs(__GAME.Directory.Zones) do
            self.MAXZONE = math.max(self.MAXZONE, z.ZoneNumber)
        end

        for _,v in pairs(__CLIENT.UpgradeCmds.All()) do
            local up = __LIBRARY.Directory.Upgrades[v.UpgradeID]
            self.UPGRADES[v.ZoneID] = {
                id = v.UpgradeID,
                currency = up.TierCurrencies[v.UpgradeTier]._id,
                cost = up.TierCosts[v.UpgradeTier]
            }
        end

        self.GetRebirth = __CLIENT.RebirthCmds.Get

        function self.GetPlayerMaxZone()
            return __CLIENT.ZoneCmds.GetMaximumZone()
        end

        function self.BuyNextZone()
            if self.GetPlayerMaxZone().ZoneNumber == self.MAXZONE
               and not __CLIENT.RebirthCmds.GetNextRebirth()
               and self.GetCurrency().Coins < self.ZONE_PRICES[self.GetPlayerMaxZone().ZoneNumber]
            then return end
            __NETWORK.SecuredInvoke("Zones_RequestPurchase", __CLIENT.ZoneCmds.GetNextZone())
        end

        self.VIP_CFRAME = CFrame.new(214, 27, -589)
        local ACTUAL_CFRAMES = {
            [1] = CFrame.new(220, 16, -204),
            [20] = CFrame.new(214, 16, 495),
            [46] = CFrame.new(1417, 16, 1758)
        }

        function self.GetLastZoneCFrame(): CFrame
            local zone = self.GetPlayerMaxZone()
            local spawns = zone.ZoneFolder.INTERACT.BREAK_ZONES
            local part = spawns:FindFirstChildOfClass("Part")
            return (ACTUAL_CFRAMES[zone.ZoneNumber] or part.CFrame) + Vector3.new(0, 3, 0)
        end

        function self.TeleportLastZone()
            local cframe = self.GetLastZoneCFrame()
            if (__LOCAL.HRP().Position - cframe.Position).magnitude >= 5 then
                __LOCAL.TeleportCFrame(cframe)
            end
        end

        function self.GetUpgrade(zone)
            local zn = (zone or self.GetPlayerMaxZone()).ZoneName
            return self.UPGRADES[zn], zn
        end

        function self.BuyUpgrade(zoneIn)
            local up, zone = self.GetUpgrade(zoneIn or self.GetPlayerMaxZone())
            if up == nil or __CLIENT.UpgradeCmds.Owns(up.id, zone)
               or __CLIENT.CurrencyCmds.Get(up.currency) < up.cost
            then return end

            __LOCAL.SetLockedPosition(zone.ZoneFolder.INTERACT.Upgrades[up.id]:FindFirstChild("Pad").CFrame + Vector3.new(0, 3, 0), 3)
            __CLIENT.UpgradeCmds.Purchase(up.id, zone)
        end

        function self.BuyAllUpgrades()
            for zone,_ in pairs(self.UPGRADES) do
                self.BuyUpgrade(zone)
            end
        end

        function self.BuyPetSlot()
            while true do
                local nextSlot = __CLIENT.Save.Get().MaxPetsEquipped - (__CLIENT.Gamepasses.Owns(259437976) and 15 or 0) - 4 + 1
                if nextSlot > __CLIENT.RankCmds.GetMaxPurchasableEquipSlots() or not __CLIENT.ZoneCmds.Owns("Green Forest")
                   or self.GetCurrency().Diamonds < __LIBRARY.Balancing.CalcPetSlotPrice(nextSlot)
                then break end

                if not __CLIENT.MachineCmds.CanUse("EquipSlotsMachine") then
                    __LOCAL.HRP().CFrame = self.ZONES["Green Forest"].ZoneFolder:FindFirstChild("EquipSlotsMachine", true).Arrow.CFrame
                end

                __NETWORK.SecuredInvoke("EquipSlotsMachine_RequestPurchase", nextSlot)
                task.wait(1)
            end
        end

        function self.Rebirth()
            local zone, rebirth = self.GetPlayerMaxZone().ZoneNumber, self.GetRebirth()
            if (zone >= 25 and rebirth == 0) or (zone >= 50 and rebirth == 1) then
                __NETWORK.SecuredInvoke("Rebirth_Request", tostring(rebirth + 1))
            end
        end

        function self.GetCurrency(): { Coins: number, Diamonds: number }
            return {
                Coins = __CLIENT.CurrencyCmds.Get("Coins"),
                Diamonds = __CLIENT.CurrencyCmds.Get("Diamonds")
            }
        end

        function self.IsVIP(): boolean
            return __CLIENT.Gamepasses.Owns(257811346)
        end

        function self.GetEquippedPets(): { string }
            local pets = {}
            for id,_ in pairs(__CLIENT.PetCmds.GetEquipped()) do
                table.insert(pets, id)
            end
            return pets
        end

        function self.GetEnchants(enchant: string): { string }
            local enchants = {}

            for k, v in pairs(__CLIENT.Save.Get().Inventory.Enchant) do
                if v.id:lower() ~= enchant:lower() then continue end

                for _ = 1, (v._am or 1) do
                    table.insert(enchants, { uid = k, tn = v.tn })
                end
            end

            return { table.unpack(
                table.map(
                    table.sorted(enchants, function(a, b) return tonumber(a.tn) > tonumber(b.tn) end),
                    function(_,v) return v.uid end
                ),
            1, __CLIENT.Save.Get().MaxEnchantsEquipped) }
        end

        function self.EquipEnchants(enchant: string)
            local equipped = __CLIENT.Save.Get().EquippedEnchants
            for k,v in pairs(self.GetEnchants(enchant)) do
                if equipped[tostring(k)] == v then continue end
                __CLIENT.EnchantCmds.Unequip(k)
                __CLIENT.EnchantCmds.Equip(v)
            end
        end
    end

    __GAME:InitFunctions()

    function __FARMING:InitFunctions()
        self.AutoCollect = false
        self.Radius = 50
        self.AutoTap = false
        self.AutoFarm = false
        self.FarmMode = "Completion"

        self.RadiusCirclePart = nil

        function self.ToggleAutoCollect()
            self.AutoCollect = not self.AutoCollect
        end

        function self.SetRadius(radius: number)
            self.Radius = radius
        end

        function self.ToggleAutoTap()
            self.AutoTap = not self.AutoTap
        end

        function self.ToggleAutoFarm()
            self.AutoFarm = not self.AutoFarm
        end

        function self.SetFarmMode(mode)
            self.FarmMode = (mode:lower() == "vip" and __GAME.IsVIP()) and "VIP" or "Completion"
            if getgenv().EngineOpts_DisableRendering then
                __TRACKER.ModeText = self.FarmMode
                __TRACKER.ModeColor = self.FarmMode == "VIP" and Color3.fromRGB(255, 217, 0) or Color3.fromRGB(0, 217, 0)
            end
        end

        function self.GetFarmMode()
            return self.FarmMode
        end

        function self.GetTrackingCurrencyType()
            return self.GetFarmMode() == "VIP" and "Diamonds" or "Coins"
        end

        function self.GetTrackingCurrency()
            return __GAME.GetCurrency()[self.GetTrackingCurrencyType()]
        end

        function self.ToggleRadiusCircle()
            if not self.RadiusCirclePart then
                self.RadiusCirclePart = Instance.new("Part")
                self.RadiusCirclePart.Shape = Enum.PartType.Cylinder
                self.RadiusCirclePart.Material = Enum.Material.Plastic
                self.RadiusCirclePart.Orientation = Vector3.new(0, 0, 90)
                self.RadiusCirclePart.Anchored = true
                self.RadiusCirclePart.CanCollide = false
                self.RadiusCirclePart.Parent = workspace
            else
                self.RadiusCirclePart:Destroy()
                self.RadiusCirclePart = nil
            end
        end

        function self.EnableFarmingUtils()
            if __CLIENT.Gamepasses.Owns(265324265) and not __CLIENT.Save.Get().AutoTapper then
                __NETWORK.SecuredInvoke("AutoTapper_Toggle")
                __CLIENT.Save.Get().AutoTapper = true
            end

            if __CLIENT.Save.Get().FavoriteModeEnabled then
                __NETWORK.SecuredFire("Pets_ToggleFavoriteMode")
                __CLIENT.Save.Get().FavoriteModeEnabled = false
            end
        end

        function self.GetAllCoinModels()
            -- Use this performant one instead of __LIBRARY.Things.Breakables:GetChildren()
            return table.iterableFilter(__CLIENT.BreakableCmds.AllByZoneAndClass(
                __CLIENT.MapCmds.GetCurrentZone(), "Normal"
            ), function(_,v)
                return v:IsA("Model") and v:FindFirstChild("Hitbox", true)
            end)
        end

        function self.GetCoins(radius)
            local function GetMag(v)
                return (__LOCAL.HRP().Position - v:FindFirstChild("Hitbox", true).Position).magnitude
            end

            return table.iterable(table.map(
                table.sorted(
                    table.iterableFilter(self.GetAllCoinModels(), function(_,v) return GetMag(v) <= (radius or self.Radius) end),
                    function(a, b) return GetMag(a) < GetMag(b) end
                ),
                function(_,v) return v.Name end
            ))
        end

        function self.Farm()
            local coins = self.GetCoins()
            if not self.AutoFarm then return coins end

            if self.FarmMode:lower() == "completion" then
                __GAME.Rebirth()
                __GAME.BuyNextZone()
                __GAME.BuyAllUpgrades()
                __GAME.BuyPetSlot()
                __GAME.EquipEnchants("Coins")
                __LOCAL.SetLockedPosition(__GAME.GetLastZoneCFrame(), 5)
            else
                __GAME.EquipEnchants("Diamonds")
                __LOCAL.SetLockedPosition(__GAME.VIP_CFRAME, 3)
            end

            if __CLIENT.MapCmds.IsInDottedBox() or self.FarmMode:lower() == "vip" then
                local pets = __GAME.GetEquippedPets()

                for _,v in pairs(coins) do
                    if #pets == 0 then pets = __GAME.GetEquippedPets() end
                    local pet = pets[1]
                    table.remove(pets, 1)

                    __NETWORK.SecuredFire("Breakables_JoinPet", v, pet)
                    task.wait(1 / #__GAME.GetEquippedPets())
                end
            end

            return coins
        end

        -- Auto Collect Loop
        __SERVICES.EventBus:Register("render", 0, .1, function()
            if not self.AutoCollect then return end

            -- Auto Orbs
            local orbs = table.values(table.map(__LIBRARY.Things.Orbs:GetChildren(), function(_,v) return tonumber(v.Name) end))
            if #orbs > 0 then
                __NETWORK.SecuredFire("Orbs: Collect", orbs)
                __LIBRARY.Things.Orbs:ClearAllChildren()
            end

            -- Auto Lootbags
            local Claim = getsenv(__GAME.Scripts.Game["Lootbags Frontend"]).Claim
            for i,v in pairs(debug.getupvalue(Claim, 1)) do
                if v.readyForCollection() then Claim(i) end
            end

            -- Auto Free Gifts
            for _,v in pairs(__GAME.GUI._MISC.FreeGifts.Frame.ItemsFrame.Gifts:GetDescendants()) do
                if v.ClassName == "TextLabel" and v.Text == "Redeem!" then
                    __NETWORK.SecuredInvoke("Redeem Free Gift", tonumber(string.match(v.Parent.Name, "%d+")))
                end
            end

            -- Auto Rank Rewards
            local ranks = require(__GAME.LibraryModule.Util.RanksUtil).GetArray()
            local redeemed = __CLIENT.Save.Get().RedeemedRankRewards
            local stars = __CLIENT.Save.Get().RankStars

            local r = table.filter(
                ranks[__CLIENT.RankCmds.GetMaxRank()].Rewards,
                function(k, v)
                    return not table.find(table.keys(redeemed), tostring(k))
                           and stars >= v.StarsRequired
                end
            )

            for k,_ in pairs(r) do
                __NETWORK.SecuredFire("Ranks_ClaimReward", tonumber(k))
            end
        end)

        -- Radius Circle Update Loop
        __SERVICES.EventBus:Register("render", 2, 0, function()
            if self.RadiusCirclePart then
                self.RadiusCirclePart.Size = Vector3.new(0.1, self.Radius * 2, self.Radius * 2)
                self.RadiusCirclePart.Position = __LOCAL.HRP().Position - Vector3.new(0, 2, 0)

                local farming = __CLIENT.MapCmds.IsInDottedBox() or self.FarmMode:lower() == "vip"
                self.RadiusCirclePart.Transparency = farming and 0.4 or 0.8
                self.RadiusCirclePart.BrickColor = BrickColor.new("Bright" .. (not farming and "red" or (self.GetFarmMode() == "VIP" and "blue" or "green")))
            end
        end)

        -- Auto Farm/Tap Loop
        __SERVICES.EventBus:Register("render", 3, 0.1, function()
            if self.AutoFarm then
                self.EnableFarmingUtils()
            end

            local coins = self.Farm()

            if self.AutoTap then
                __NETWORK.SecuredFire("Breakables_PlayerDealDamage", coins[1])
            end
        end)

        self.analytics_success, self.analytics_ws = false, nil
        self.analytics_last_amount = self.GetTrackingCurrency()

        local function shorten(num)
            return (self.GetTrackingCurrencyType() == "Diamonds" and __LIBRARY.Functions.Commas or __LIBRARY.Functions.NumberShorten)(num)
        end

        __SERVICES.EventBus:Register("render", 4, getgenv().EngineOpts_AnalyticDelay or 10, function()
            if self.GetTrackingCurrencyType() == "Coins" then
                __TRACKER.TrackText = "Coins Tracker disabled temporarily"
                __TRACKER.TrackColor = Color3.fromRGB(245, 76, 76)
                return
            end

            if not self.analytics_ws then ConnectWS() end

            local delta = self.GetTrackingCurrency() - self.analytics_last_amount
            self.analytics_last_amount = self.GetTrackingCurrency()
            if delta <= 0 then return end

            self.analytics_ws:Send(__SERVICES.HTTP:JSONEncode({
                id = __GAME.LocalPlayer.UserId,
                username = __GAME.LocalPlayer.Name,
                currency = string.lower(self.GetTrackingCurrencyType()),
                amount = delta
            }))
        end)
    end

    __FARMING:InitFunctions()

    function __PLAZA:InitFunctions()
        self.CMDS = __CLIENT.TradingPlazaCmds
        self.IsInPlaza = self.CMDS.IsOnTradingPlaza

        local function ParsePlaza(plazaType: number)
            return self.CMDS.GetAvailable()[math.min(plazaType or 1, 2)]
        end

        function self.CanAccess(plazaType: number)
            return ParsePlaza(plazaType).CanAccess()
        end

        function self.TeleportPlaza(plazaType: number)
            return self.CMDS.RequestTradingPlaza(ParsePlaza(plazaType).PlaceId)
        end

        -- // Prevents errors when calling from non-Plaza
        self.GetAllBooths = function() return {} end
        self.GetAllListings = function() return {} end
        if not self.IsInPlaza() then return end

        self.BoothEnv = getsenv(__GAME.Scripts.Game["Trading Plaza"]["Booths Frontend"])

        function self.GetAllBooths()
            return table.values(table.filter(
                debug.getupvalues(self.BoothEnv.cachePacket)[1],
                function(_,v) return #table.keys(v.Listings) > 0 end
            ))
        end

        function self.GetAllListings()
            local listings = {}
            for _,b in pairs(self.GetAllBooths()) do
                for i,l in pairs(b.Listings) do
                    l.PlayerID = b.PlayerID
                    l.BoothID = b.BoothID
                    l.ListingID = i
                    table.insert(listings, l)
                end
            end
            return listings
        end

        function self.GetCFrame(uid: string): CFrame
            for _,v in pairs(__LIBRARY.Things.Booths:GetChildren()) do
                for _,p in pairs(v.Pets.BoothTop.PetScroll:GetChildren()) do
                    if p.Name == uid then
                        return v:FindFirstChild("Booth") and v.Booth.CFrame or nil
                    end
                end
            end
            return nil
        end
    end

    __PLAZA:InitFunctions()
end

return Engine
