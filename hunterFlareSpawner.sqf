// Swatter Multiplayer, Darren 'Dabbo' Edmonds.
// hunterFlareSpawner.sqf

// Give Hunter (A164) a new flare every 3 seconds (parameter?) to a max of 120 (game limit).

if (isDedicated || isServer) then {
	while {true} do {
		if (alive hunterPlane) then {
			_mags = hunterPlane ammo "CMFlareLauncher";
			if (_mags < 120) then {
				_mags = _mags + 1;
				hunterPlane setAmmo ["CMFlareLauncher", _mags];
			};
		};
		sleep 1.5;
	};
};