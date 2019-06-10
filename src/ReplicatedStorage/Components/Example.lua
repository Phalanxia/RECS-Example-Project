local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RECS = require(ReplicatedStorage.Packages.RECS)

local Example = RECS.defineComponent({
	name = "Example",
	generator = function()
			return {
				exampleValue = true,
			}
	end,
})

return Example
