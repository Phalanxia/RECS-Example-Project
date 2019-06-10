local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Wait for the client's initial replication to complete.
-- This should allow us to avoid having a mountian of WaitForChilds 😅
repeat wait(0.1) until game:IsLoaded()

-- Dependencies
local RECS = require(ReplicatedStorage.Packages.RECS)
local Steppers = require(ReplicatedStorage.Steppers)

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
recsCore:registerComponentsInInstance(ReplicatedStorage.Components)
recsCore:registerSystemsInInstance(ReplicatedStorage.Systems)
recsCore:registerSteppers(Steppers)
recsCore:start()
