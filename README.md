# Mathematical State Machine


## DESCRIPTION: 
Simple and flexible implementation of a state machine using mathematics. The purpose of this to replace finite state machines (FSMs) rigidity with something very flexible and extensible. FSMs have instant transitions between states which makes it unappealing for visual processes such as animations. FSMs also get complicated when you have to layer them, for example a state that can be activated inside some states but not other states (a leaderboard can be accessed both when a player is alive and dead).

This state machine automatically calculates outputs when inputs change. This can be used for purely mathematical applications but my intended use is for a large state machine for video games. It allows multiple states to be active at the same time. States have alphas and can smoothly transition between other states. States rely on the inputs and the method of converting the inputs to outputs. For example, the linear evaluation method will check to make sure all inputs are at or above the given threshold ex. ice amount could be temperature <= 32 and waterAmount >= 0. For a better example, you can have input of height and weight, the state would calculate their bmi, and output a boolean if its below or above a specified amount. More data can be added to the states, for example a threshold alpha which can be used in the evaluation function.

## USE: 
Improper use of the system is possible (inputs changing because somewhere else in code theyre being changed) but performance is more important than safety for my application for this. While this is intended for alphas (numbers from 0 to 1), this can be used for any data type, notably booleans, because the evaluation functions can be custom.

## SETUP: 
Put the main.lua inside a script, msm.lua as a module inside main, and evalTemplates as a module inside msm. Example use is in main. 

## TODO: 
Automatically manage states linked to inputs so we don't have to check every state when an input changes
