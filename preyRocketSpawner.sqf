// Swatter Multiplayer, Darren 'Dabbo' Edmonds.
// preyRocketSpawner.sqf

// Client Side Script; Ensures all players will have a new rocket every so often.

_flip = 0;
while {true} do {
	if (!isNil "hunterPlane") then {
		if ((alive player) && !(player IN hunterPlane) && (_flip == 0)) then {
			_mags = { _x == "Titan_AA" } count magazines player;
			if (_mags < 1) then {
				player addMagazine "Titan_AA";
			};
		};
		_flip = 1 - _flip;
	};
	sleep 20;
};
