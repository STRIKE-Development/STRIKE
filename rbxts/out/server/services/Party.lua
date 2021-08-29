-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, TS.getModule(script, "@flamework", "core").out).Reflect
local MatchMaking
do
	MatchMaking = setmetatable({}, {
		__tostring = function()
			return "MatchMaking"
		end,
	})
	MatchMaking.__index = MatchMaking
	function MatchMaking.new(...)
		local self = setmetatable({}, MatchMaking)
		return self:constructor(...) or self
	end
	function MatchMaking:constructor()
	end
	function MatchMaking:onTick(dt)
		print("My service is ticking", dt)
	end
end
-- (Flamework) MatchMaking metadata
Reflect.defineMetadata(MatchMaking, "identifier", "flamework-template:rbxts/out/server/services/Party@MatchMaking")
Reflect.defineMetadata(MatchMaking, "flamework:isExternal", false)
Reflect.defineMetadata(MatchMaking, "flamework:decorators", { "$:flamework@Service" })
Reflect.defineMetadata(MatchMaking, "flamework:decorators.$:flamework@Service", {
	type = "Service",
})
return {
	MatchMaking = MatchMaking,
}
