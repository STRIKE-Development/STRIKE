-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, TS.getModule(script, "@flamework", "core").out).Reflect
local BaseComponent = TS.import(script, TS.getModule(script, "@flamework", "components").out).BaseComponent
local MyComponent
do
	local super = BaseComponent
	MyComponent = setmetatable({}, {
		__tostring = function()
			return "MyComponent"
		end,
		__index = super,
	})
	MyComponent.__index = MyComponent
	function MyComponent.new(...)
		local self = setmetatable({}, MyComponent)
		return self:constructor(...) or self
	end
	function MyComponent:constructor()
		super.constructor(self)
	end
	function MyComponent:onStart()
		print("Wow! I'm attached to " .. self.instance:GetFullName())
	end
	function MyComponent:destroy()
	end
end
-- (Flamework) MyComponent metadata
Reflect.defineMetadata(MyComponent, "identifier", "flamework-template:rbxts/out/server/components/c@MyComponent")
Reflect.defineMetadata(MyComponent, "flamework:isExternal", false)
Reflect.defineMetadata(MyComponent, "flamework:implements", { "$:flamework@OnStart" })
Reflect.defineMetadata(MyComponent, "flamework:decorators", { "$c:init@Component" })
Reflect.defineMetadata(MyComponent, "flamework:decorators.$c:init@Component", {
	type = "Component",
	attributes = {},
})
return {
	MyComponent = MyComponent,
}
