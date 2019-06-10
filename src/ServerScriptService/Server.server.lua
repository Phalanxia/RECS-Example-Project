local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RECS = require(ReplicatedStorage.Packages.RECS)
local Steppers = require(ServerScriptService.Steppers)

-- RECS Plugins
local CollectionServicePlugin = require(ReplicatedStorage.RecsPlugins.CollectionService)
local ComponentChangedEventPlugin = require(ReplicatedStorage.RecsPlugins.ComponentChangedEvent)

--[[
	RECS
	================
]]

local recsCore = RECS.Core.new({
	CollectionServicePlugin(),
	ComponentChangedEventPlugin,
})
recsCore:registerComponentsInInstance(ServerScriptService.Components)
recsCore:registerSystemsInInstance(ServerScriptService.Systems)
recsCore:registerSteppers(Steppers)
recsCore:start()

