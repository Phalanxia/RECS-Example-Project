local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RECS = require(ReplicatedStorage.Packages.RECS)
local ExampleSystem = require(ReplicatedStorage.Systems.Example)

local steppers = {
	RECS.interval(1, {
		ExampleSystem,
	}),
}

return steppers
