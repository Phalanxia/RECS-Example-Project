local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RECS = require(ReplicatedStorage.Packages.RECS)
local ExampleComponent = require(ServerScriptService.Components.Example)

--[[
	System setup
	================
]]

local Example = RECS.System:extend("Example")

function Example:init()
	for instance, component in self.core:components(ExampleComponent) do
		self:added(instance, component)
	end

	self.componentAddedSignal = self.core:getComponentAddedSignal(ExampleComponent)
	self.maid.componentAddedConnection = self.componentAddedSignal:connect(function(component, instance)
		self:added(instance, component)
	end)

	self.componentRemovingSignal = self.core:getComponentRemovingSignal(ExampleComponent)
	self.maid.componentRemovingConnection = self.componentRemovingSignal:connect(function(instance, component)
		self:removing(instance, component)
	end)
end

function Example:added(instance, component)
	wait() -- HACK, having to wait for the inst to have the component applied

	-- Do added stuff with the component here!
end

function Example:removing(instance, component)
	wait() -- HACK, having to wait for the inst to have the component applied

	-- Do removing stuff with the component here!
end

function Example:step(dt)
	-- Do stuff on step!
end

return Example
