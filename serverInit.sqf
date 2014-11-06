serverLastHunter = plr00;
serverCurrentHunter = plr00;

uiSleep 15;
spawnNewPlaneFunc = {
	private ["_unit"];
	_unit = _this select 0;
	
	_rMarker = floor(random 6);
	_rMarkerName = format["spawn0%1", _rMarker];
	
	_spawnPos = getMarkerPos _rMarkerName;
	hunterPlane = "B_Plane_CAS_01_F" createVehicle _spawnPos;
	hunterPlane setposATL [_spawnPos select 0, _spawnPos select 1, 800];
	hunterPlane setDir markerDir _rMarkerName;
	hunterPlane flyInHeight 800;
	hunterPlane engineOn true;

	hunterPlane removeWeaponTurret ["Gatling_30mm_Plane_CAS_01_F", [0-1]];
	hunterPlane removeWeaponTurret ["Missile_AA_04_Plane_CAS_01_F", [0-1]];
	hunterPlane removeWeaponTurret ["Missile_AGM_02_Plane_CAS_01_F", [0-1]];
	hunterPlane removeWeaponTurret ["Rocket_04_HE_Plane_CAS_01_F", [0-1]];
	hunterPlane removeWeaponTurret ["Rocket_04_AP_Plane_CAS_01_F", [0-1]];

	hunterPlane lock true;

	_vel = velocity hunterPlane;
	_dir = markerDir _rMarkerName;
	_speed = 100;
	hunterPlane setVelocity [
		(_vel select 0) + (sin _dir * _speed),
		(_vel select 1) + (cos _dir * _speed),
		(_vel select 2)
	];	

	_unit moveInDriver hunterPlane;
	
	netMsgNewHunter= [ _unit, serverLastHunter ];
	publicVariable "netMsgNewHunter";
	
	if (isServer) then {
		// If this is a listen server, ensure player has a message notification.
		netMsgNewHunter call clientHunterMessage;
	};
};

handleNotificationFunc = {
	// [0:Player, 1:Killed Unit, 2:Killer Unit]
	player globalChat format["Note: last(%1) killer(%2)", netMsgHunterKilled select 1, netMsgHunterKilled select 2];
	serverLastHunter = netMsgHunterKilled select 1;
	serverCurrentHunter = netMsgHunterKilled select 2;
	if (serverLastHunter == serverCurrentHunter) then {
		_selPlr = floor(random (count playableUnits));
		serverLastHunter = plr00;
		serverCurrentHunter = (playableUnits select _selPlr);
	};
	[serverCurrentHunter] call spawnNewPlaneFunc;
};

"netMsgHunterKilled" addPublicVariableEventHandler {
	call handleNotificationFunc;
};

// Select First Hunter
uiSleep 2;
_selPlr = floor(random (count playableUnits));
serverLastHunter = plr00;
serverCurrentHunter = (playableUnits select _selPlr);
[serverCurrentHunter] call spawnNewPlaneFunc;

uiSleep 10;
execVM "preyRocketSpawner.sqf";
execVM "preyTracker.sqf";
execVM "hunterBombSpawner.sqf";
execVM "hunterFlareSpawner.sqf";

