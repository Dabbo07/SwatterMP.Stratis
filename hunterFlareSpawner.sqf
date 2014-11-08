// Swatter Multiplayer, Darren 'Dabbo' Edmonds.
// hunterFlareSpawner.sqf

// Client Side Only; Give Hunter (A164) a new flare every 3 seconds (parameter?) to a max of 120 (game limit).

while {true} do {
	if (!isNil "hunterPlane") then {
		if ((alive player) && (player IN hunterPlane)) then {
			_mags = hunterPlane ammo "CMFlareLauncher";
			if (_mags < 120) then {
				_mags = _mags + 1;
				hunterPlane setAmmo ["CMFlareLauncher", _mags];
			};
		};
	};
	sleep 1;
};

