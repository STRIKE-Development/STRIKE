-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
-- Load Knit:
local Knit = TS.import(script, TS.getModule(script, "@rbxts", "knit").Knit).KnitClient
-- Create Controller:
local Controller = Knit.CreateController({
	Name = "Controller",
	Property = "",
	Method = function(self) end,
	KnitInit = function(self) end,
	KnitStart = function(self) end,
})
-- Export:
local exports = Controller
return exports
