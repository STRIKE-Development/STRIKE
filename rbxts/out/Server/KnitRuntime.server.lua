-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
-- Server Runtime (0.0.20-alpha)
-- Written by OminousVibes#7259
-- 8/13/21
local RunService = TS.import(script, TS.getModule(script, "@rbxts", "services")).RunService
local _knit = TS.import(script, TS.getModule(script, "@rbxts", "knit").Knit)
local Knit = _knit.KnitServer
local Component = _knit.Component
local Globals = TS.import(script, game:GetService("ReplicatedStorage"), "TSsss", "Globals")
-- Fetch Folders:
local Root = script.Parent
local Services = Root:WaitForChild("Services", 45)
local Components = Root:WaitForChild("Components", 45)
local Modules = Root:WaitForChild("Modules", 45)
local _arg0 = Services and Components and Modules
assert(_arg0, "[Knit Server]: Required Knit Dependencies may be missing!")
-- Populate Globals:
Globals.Modules = Modules
-- Add Services & Components:
Knit.AddServicesDeep(Services)
Component.Auto(Components)
-- Start Knit:
local _exp = Knit.Start()
local _arg0_1 = function()
	if RunService:IsStudio() then
		print("[Knit Server]: Initialized!")
	end
end
_exp:andThen(_arg0_1):catch(function(Exception)
	warn("[Knit Server]: " .. Exception)
end):await()
