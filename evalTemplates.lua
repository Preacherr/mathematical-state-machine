return {
	alphaLinear = function(inputs, state) --all states have to be >= threshold
		local threshold = state.threshold
		for i,v in pairs(state.inputs) do
			if inputs[i] < threshold then return false end
		end
		return true
	end;

	alphaLinearExclusive = function(inputs, state)
		local threshold = state.threshold
		for i,v in pairs(state.inputs) do
			if inputs[i] <= threshold then return false end
		end
		return true
	end;

	alphaMultiply = function(inputs, state) --all states multiplied together have to be >= threshold
		local threshold = state.threshold
		local val = 1
		
		for i,v in pairs(state.inputs) do
			val *= inputs[i]
		end

		return val >= threshold
	end;

	alphaAverage = function(inputs, state) --all states averaged together have to be >= threshold
		local threshold = state.threshold
		local val = 0
		local numVals = 0

		for i,v in pairs(state.inputs) do
			val += inputs[i]
			numVals += 1
		end

		return (val / numVals) >= threshold
	end;
}
