-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage = TS.import(script, TS.getModule(script, "@rbxts", "services")).ReplicatedStorage
local Globals = {
	Modules = nil,
	Shared = ReplicatedStorage:FindFirstChild("Shared"),
	Assets = ReplicatedStorage:FindFirstChild("Assets"),
}
return Globals
