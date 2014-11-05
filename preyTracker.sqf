// Swatter Multiplayer, Darren 'Dabbo' Edmonds.
// preyTracker.sqf

// Updates markers on player positions.

if (isDedicated || isServer) then {
	
	_flip = 0;
	while {true} do {
		{
			{ 
				_x setMarkerShape "ICON";
			} forEach plrMarkers;
		
			if ((alive _x) && !(_x IN hunterPlane)) then {
				_unitPos = position _x;
				_markName = format["M%1", _x];
				_markName setMarkerShape "ELLIPSE";
				_markName setMarkerPos _unitPos;
				_smoke = "SmokeShellRed" createVehicle [(_unitPos select 0),(_unitPos select 1), 0];
				if (_flip == 1) then {
					_light = "Chemlight_blue" createVehicle [(_unitPos select 0),(_unitPos select 1), 0];
				}
			};
		} forEach playableUnits;
		_flip = 1 - _flip;
		sleep 55;
	};
};