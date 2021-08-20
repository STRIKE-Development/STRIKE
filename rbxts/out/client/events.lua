-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GlobalEvents = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "events").GlobalEvents
local Events = GlobalEvents.client
return {
	Events = Events,
}
