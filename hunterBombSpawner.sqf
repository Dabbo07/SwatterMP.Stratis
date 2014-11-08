// Swatter Multiplayer, Darren 'Dabbo' Edmonds.
// hunterBombSpawner.sqf

// Client Side Only; Give Hunter (A164) a new bomb every 15 seconds (parameter?) to a max of 4 (game limit).

while {true} do {
	if (!isNil "hunterPlane") then {
		if ((alive player) && (player IN hunterPlane)) then {
			_mags = hunterPlane ammo (currentweapon hunterPlane);
			if (_mags < 4) then {
				_mags = _mags + 1;
				hunterPlane setAmmo [currentweapon hunterPlane, _mags];
			};
		};
	};
	sleep 5;
};

