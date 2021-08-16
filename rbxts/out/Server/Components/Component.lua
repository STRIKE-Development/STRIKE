-- Compiled with roblox-ts v1.2.3
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Janitor = TS.import(script, TS.getModule(script, "@rbxts", "knit").Knit).Janitor
-- Create Component:
local NewComponent
do
	NewComponent = setmetatable({}, {
		__tostring = function()
			return "NewComponent"
		end,
	})
	NewComponent.__index = NewComponent
	function NewComponent.new(...)
		local self = setmetatable({}, NewComponent)
		return self:constructor(...) or self
	end
	function NewComponent:constructor(Object)
		self.janitor = Janitor.new()
	end
	function NewComponent:Init()
	end
	function NewComponent:Destroy()
		self.janitor:Destroy()
	end
	NewComponent.Tag = "Component"
end
-- Export:
return NewComponent
