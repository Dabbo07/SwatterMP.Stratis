uiSleep 20;

serverNewHunter = plr00;
serverOldHunter = plr00;

getRandomPlayer = {
	// Returns a random player object from available player pool.
	_selPlr = floor(random (count playableUnits));
	(playableUnits select _selPlr);
};

"hunterDeathMessage" addPublicVariableEventHandler {
	// Called when a hunter has been killed, from onPlayerKilled.sqf
	_oldHunter = hunterDeathMessage select 0;
	_newHunter = hunterDeathMessage select 1;
	if (_newHunter == plr00) then {
		_newHunter = call getRandomPlayer;
	};
	serverNewHunter = _newHunter;
	serverOldHunter = _oldHunter;
};

execVM "hunterMonitor.sqf";
execVM "preyTracker.sqf";

