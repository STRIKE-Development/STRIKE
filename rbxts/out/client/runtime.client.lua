-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Flamework = TS.import(script, TS.getModule(script, "@flamework", "core").out).Flamework
Flamework._addPaths({ "StarterPlayer", "StarterPlayerScripts", "TS", "controllers" })
Flamework._addPaths({ "StarterPlayer", "StarterPlayerScripts", "TS", "components" })
Flamework._addPaths({ "ReplicatedStorage", "TS", "components" })
Flamework.ignite()
