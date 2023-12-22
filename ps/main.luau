getgenv().EngineOpts_Optimization = true
getgenv().EngineOpts_AntiAFK = true
getgenv().EngineOpts_DisableRendering = true
getgenv().EngineOpts_AnalyticDelay = 10

local Engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/XxBoomer/script/main/ps/engine.luau"))()
Engine:Init()

Engine.__FARMING.ToggleAutoCollect()
Engine.__FARMING.ToggleRadiusCircle()
Engine.__FARMING.SetRadius(70)
Engine.__FARMING.SetFarmMode("VIP")
Engine.__FARMING.ToggleAutoFarm()
Engine.__FARMING.ToggleAutoTap()
