-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
-- Client Runtime (0.0.20-alpha)
-- Written by OminousVibes#7259
-- 8/13/21
local RunService = TS.import(script, TS.getModule(script, "@rbxts", "services")).RunService
local _knit = TS.import(script, TS.getModule(script, "@rbxts", "knit").Knit)
local Knit = _knit.KnitClient
local Component = _knit.Component
local Globals = TS.import(script, game:GetService("ReplicatedStorage"), "TSsss", "Globals")
-- Fetch Folders:
local Root = script.Parent
local Controllers = Root:WaitForChild("Controllers", 45)
local Components = Root:WaitForChild("Components", 45)
local Modules = Root:WaitForChild("Modules", 45)
local _arg0 = Controllers and Components and Modules
assert(_arg0, "[Knit Client]: Required Knit Dependencies may be missing!")
-- Populate Globals:
Globals.Modules = Modules
-- Add Controllers & Components:
Knit.AddControllersDeep(Controllers)
Component.Auto(Components)
-- Start Knit:
local _exp = Knit.Start()
local _arg0_1 = function()
	if RunService:IsStudio() then
		print("[Knit Client]: Initialized!")
	end
end
_exp:andThen(_arg0_1):catch(function(Exception)
	warn("[Knit Client]: " .. Exception)
end):await()
