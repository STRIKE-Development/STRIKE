-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
-- Server Runtime (0.0.18-alpha)
-- Written by OminousVibes#7259
-- 8/13/21
local _services = TS.import(script, TS.getModule(script, "@rbxts", "services"))
local Players = _services.Players
local RunService = _services.RunService
local CollectionService = _services.CollectionService
local _knit = TS.import(script, TS.getModule(script, "@rbxts", "knit").Knit)
local Knit = _knit.KnitServer
local Component = _knit.Component
local Globals = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Globals")
-- Fetch Folders:
local Root = script.Parent
local Components = Root:FindFirstChild("Components")
local Services = Root:FindFirstChild("Services")
local Modules = Root:FindFirstChild("Modules")
assert(Components, "[Knit Server]: Components may have gone missing.")
assert(Services, "[Knit Server]: Services may have gone missing.")
assert(Modules, "[Knit Server]: Modules may have gone missing.")
-- Populate Globals:
Globals.Modules = Modules
-- Add controllers & components:
Knit.AddServicesDeep(Services)
Component.Auto(Components)
-- Start Knit:
local _exp = Knit.Start()
local _arg0 = function()
	if RunService:IsStudio() then
		print("[Knit Server]: Initialized!")
	end
	for _, Player in ipairs(Players:GetChildren()) do
		CollectionService:AddTag(Player, "Player")
	end
	Players.PlayerAdded:Connect(function(Player)
		return CollectionService:AddTag(Player, "Player")
	end)
end
_exp:andThen(_arg0):catch(function(Exception)
	warn("[Knit Server]: " .. Exception)
end):await()
