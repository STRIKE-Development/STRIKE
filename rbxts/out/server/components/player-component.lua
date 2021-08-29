-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local t = TS.import(script, TS.getModule(script, "@rbxts", "t").lib.ts).t
local Reflect = TS.import(script, TS.getModule(script, "@flamework", "core").out).Reflect
local Players = TS.import(script, TS.getModule(script, "@rbxts", "services")).Players
local ProfileService = TS.import(script, TS.getModule(script, "@rbxts", "profileservice").src)
local Template = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "data", "datastore").Template
local BaseComponent = TS.import(script, TS.getModule(script, "@flamework", "components").out).BaseComponent
-- Constants:
local ProfileStore = ProfileService.GetProfileStore("Player", Template)
local LoadProfile = TS.async(function(Player)
	local Profile = ProfileStore:LoadProfileAsync("Player: " .. tostring(Player.UserId))
	if Profile then
		Profile:AddUserId(Player.UserId)
		Profile:Reconcile()
		Profile:ListenToRelease(function()
			Player:Kick()
		end)
		if Players:IsAncestorOf(Player) then
			return Profile
		else
			Profile:Release()
			error("Player left before profile loaded.")
		end
	else
		Player:Kick()
		error("Profile failed to load.")
	end
end)
-- Component:
local PlayerComponent
do
	local super = BaseComponent
	PlayerComponent = setmetatable({}, {
		__tostring = function()
			return "PlayerComponent"
		end,
		__index = super,
	})
	PlayerComponent.__index = PlayerComponent
	function PlayerComponent.new(...)
		local self = setmetatable({}, PlayerComponent)
		return self:constructor(...) or self
	end
	function PlayerComponent:constructor(...)
		super.constructor(self, ...)
	end
	function PlayerComponent:FetchCache()
		return self.Profile.Data
	end
	function PlayerComponent:OverrideCache(Value)
		self.Profile.Data = Value
	end
	function PlayerComponent:UpdateCache(cb)
		self:OverrideCache(cb(self:FetchCache()))
	end
	function PlayerComponent:onStart()
		local Player = self.instance
		LoadProfile(Player):andThen(function(Profile)
			self.Profile = Profile
		end):catch(function(Exception)
			warn("[Component " .. Player.DisplayName .. "]: " .. tostring(Exception))
		end)
	end
end
-- (Flamework) PlayerComponent metadata
Reflect.defineMetadata(PlayerComponent, "identifier", "flamework-template:rbxts/out/server/components/player-component@PlayerComponent")
Reflect.defineMetadata(PlayerComponent, "flamework:isExternal", false)
Reflect.defineMetadata(PlayerComponent, "flamework:implements", { "$:flamework@OnStart" })
Reflect.defineMetadata(PlayerComponent, "flamework:decorators", { "$c:init@Component" })
Reflect.defineMetadata(PlayerComponent, "flamework:decorators.$c:init@Component", {
	type = "Component",
	tag = "Player",
	attributes = {},
	instanceGuard = t.instanceIsA("Player"),
})
return {
	PlayerComponent = PlayerComponent,
}
