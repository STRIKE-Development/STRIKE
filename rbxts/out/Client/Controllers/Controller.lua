-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, TS.getModule(script, "@flamework", "core").out).Reflect
local MyController
do
	MyController = setmetatable({}, {
		__tostring = function()
			return "MyController"
		end,
	})
	MyController.__index = MyController
	function MyController.new(...)
		local self = setmetatable({}, MyController)
		return self:constructor(...) or self
	end
	function MyController:constructor()
	end
	function MyController:onRender(dt)
		print("My controller is rendering", dt)
	end
end
-- (Flamework) MyController metadata
Reflect.defineMetadata(MyController, "identifier", "flamework-template:rbxts/out/client/controllers/Controller@MyController")
Reflect.defineMetadata(MyController, "flamework:isExternal", false)
Reflect.defineMetadata(MyController, "flamework:implements", { "$:flamework@OnRender" })
Reflect.defineMetadata(MyController, "flamework:decorators", { "$:flamework@Controller" })
Reflect.defineMetadata(MyController, "flamework:decorators.$:flamework@Controller", {
	type = "Controller",
})
return {
	MyController = MyController,
}
