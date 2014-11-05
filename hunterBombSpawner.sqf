// Swatter Multiplayer, Darren 'Dabbo' Edmonds.
// hunterBombSpawner.sqf

// Give Hunter (A164) a new bomb every 15 seconds (parameter?) to a max of 4 (game limit).

if (isDedicated || isServer) then {
	while {true} do {
		if (alive hunterPlane) then {
			_mags = hunterPlane ammo (currentweapon hunterPlane);
			if (_mags < 4) then {
				//hunterPlane addMagazineTurret ["4Rnd_Bomb_04_F", [-1]];
				_mags = _mags + 1;
				hunterPlane setAmmo [currentweapon hunterPlane, _mags];
			};
		};
		sleep 15;
	};
};