local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local RECS = require(ReplicatedStorage.Packages.RECS)
local ExampleSystem = require(ReplicatedStorage.Systems.Example)

local steppers = {
	RECS.event(RunService.RenderStepped, {
		ExampleSystem,
	}),
}

return steppers
