-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Networking = TS.import(script, TS.getModule(script, "@flamework", "networking").out).Networking
local GlobalEvents = Networking._createEvent("flamework-template:rbxts/out/shared/events@GlobalEvents", {}, {})
return {
	GlobalEvents = GlobalEvents,
}
