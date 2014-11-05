// Swatter Multiplayer, Darren 'Dabbo' Edmonds.
// preyRocketSpawner.sqf

// Ensures all players will have a new rocket every so often.

if (isDedicated || isServer) then {
	_flip = 0;
	while {true} do {
		{
			if ((alive _x) && !(_x IN hunterPlane) && (_flip == 0)) then {
				_thisUnit = _x;
				_mags = { _x == "Titan_AA" } count magazines _thisUnit;
				if (_mags < 1) then {
					_thisUnit addMagazine "Titan_AA";
				};
			};
		} forEach playableUnits;
		_flip = 1 - _flip;
		sleep 25;
	};
};