-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, TS.getModule(script, "@flamework", "core").out).Reflect
local Datastore
do
	Datastore = setmetatable({}, {
		__tostring = function()
			return "Datastore"
		end,
	})
	Datastore.__index = Datastore
	function Datastore.new(...)
		local self = setmetatable({}, Datastore)
		return self:constructor(...) or self
	end
	function Datastore:constructor()
	end
	function Datastore:onTick(dt)
		print("My service is ticking", dt)
	end
end
-- (Flamework) Datastore metadata
Reflect.defineMetadata(Datastore, "identifier", "flamework-template:rbxts/out/server/services/Datastore@Datastore")
Reflect.defineMetadata(Datastore, "flamework:isExternal", false)
Reflect.defineMetadata(Datastore, "flamework:implements", { "$:flamework@OnTick" })
Reflect.defineMetadata(Datastore, "flamework:decorators", { "$:flamework@Service" })
Reflect.defineMetadata(Datastore, "flamework:decorators.$:flamework@Service", {
	type = "Service",
})
return {
	Datastore = Datastore,
}
