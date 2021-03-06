--mathematical state machine
--preacher 2021


local msm = {}


--PURPOSE: finite state machines are binary (instant transitions), and need to be layered for states to exist within another states or states spanding multiple parent states.
--this is an attempt to remove hierarchy from a state machine. this state machine is intended for alphas (0-1) but also flexible enough to be any value including bools

--USES: simple replacement for complex state machines with hierarchical logic, animation state machines (using numbers for alphas for animation blending)

--POSSIBLE IMPROVEMENTS: instead of checking every single state to see if its connected to a state that just changed,
--have an automated way to get connected states


local defaultThreshold = 1
local evalTemplates = require(script.evalTemplates)
local defaultEval = evalTemplates.alphaLinear


function msm.new(inputs)
	local states = {}
	inputs = inputs or {}
	
	local functions = {}
	
	functions.setInput = function(name, value)
		inputs[name] = value
		
		for i,v in pairs(states) do
			if v.inputs[name] then
				v.output = v.evalFunc(inputs, v)
				if v.isInput then
					inputs[i] = v.output
				end
			end
		end
	end
	
	functions.newState = function(name, inputs, evalFunc)
		local newState = {
			inputs = inputs or nil; --table of strings
			output = false;
			isInput = false;
		}
		
		local evalType = type(evalFunc)
		if evalType == "function" then
			newState.evalFunc = evalFunc
		elseif evalType == "string" then
			newState.evalFunc = evalTemplates[evalFunc]
		else
			newState.evalFunc = defaultEval
		end
		
		states[name] = newState
	end
	
	functions.getStateOutput = function(name) --shortcut for just manually referencing it, not necessary
		return states[name].output
	end
	
	return functions
end


return msm
