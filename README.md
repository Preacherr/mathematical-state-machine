# Mathematical State Machine


Simple and flexible implementation of a state machine using mathematics. The purpose of this to replace finite state machines (FSMs) rigidity with something more dynamic. FSMs have instant transitions between states which makes it unappealing for visual processes such as animations. FSMs also get complicated when you have to layer them, for example a state that can be activated inside some states but not other states (a leaderboard can be accessed both when a player is alive and dead).

TODO: automatically manage states linked to inputs so we don't have to check every state when an input changes
