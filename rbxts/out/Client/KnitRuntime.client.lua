-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
-- Client Runtime (0.0.20-alpha)
-- Written by OminousVibes#7259
-- 8/13/21
local RunService = TS.import(script, TS.getModule(script, "@rbxts", "services")).RunService
local _knit = TS.import(script, TS.getModule(script, "@rbxts", "knit").Knit)
local Knit = _knit.KnitClient
local Component = _knit.Component
local Globals = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "Globals")
-- Fetch Folders:
local Root = script.Parent
local Components = Root:FindFirstChild("Components")
local Controllers = Root:FindFirstChild("Controllers")
local Modules = Root:FindFirstChild("Modules")
assert(Components, "[Knit Client]: Components may have gone missing.")
assert(Controllers, "[Knit Client]: Controllers may have gone missing.")
assert(Modules, "[Knit Client]: Modules may have gone missing.")
-- Populate Globals:
Globals.Modules = Modules
-- Add controllers & components:
Knit.AddControllersDeep(Controllers)
Component.Auto(Components)
-- Start Knit:
local _exp = Knit.Start()
local _arg0 = function()
	if RunService:IsStudio() then
		print("[Knit Client]: Initialized!")
	end
end
_exp:andThen(_arg0):catch(function(Exception)
	warn("[Knit Client]: " .. Exception)
end):await()
