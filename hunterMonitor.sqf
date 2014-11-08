// Swatter Multiplayer, Darren 'Dabbo' Edmonds.
// hunterMonitor.sqf

// Verify hunterPlane is alive, if not, spawn new one after 2nd check.

if (isDedicated || isServer) then {
	while {true} do {
		if (hunterPlane == plr00 || (hunterPlane != plr00 && !alive hunterPlane)) then {
			// HunterPlane is not alive, allow 10 more seconds to pass to ensure no other process is spawning.
			uiSleep 10;
			if (hunterPlane == plr00 || (hunterPlane != plr00 && !alive hunterPlane)) then {
				// HunterPlane is still not alive, (player drop-out or sync issue).
				diag_log format["Hunter monitor 1: -%1- Old-  -%2-", serverNewHunter, serverOldHunter];
				if (serverNewHunter == plr00 || !alive serverNewHunter) then {
					_selPlr = floor(random (count playableUnits));
					serverNewHunter = (playableUnits select _selPlr);
					serverOldHunter = plr00;
				};
				diag_log format["Hunter monitor 2: -%1- Old-  -%2-", serverNewHunter, serverOldHunter];
				hunterSpawnMessage = [ serverNewHunter, serverOldHunter ];
				publicVariable "hunterSpawnMessage";
			};
		};
		uiSleep 2.5;
	};
};