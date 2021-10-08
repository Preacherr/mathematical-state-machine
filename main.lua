local msm = require(script.msm)


local gameData = {
	matchInSession = 1;
	health = 0;
}


local machine = msm.new(gameData)

machine.newState("canSpawn", {health = true, matchInSession = true}, "alphaLinearExclusive", 0)

print(machine.getState("canSpawn")) -- false

machine.setInput("health", 100)

print(machine.getState("canSpawn")) -- true
