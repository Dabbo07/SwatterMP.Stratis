
uiSleep 15;
spawnNewPlaneFunc = {
	private ["_unit"];
	_unit = _this;
	
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
	
	monkey = 2;
	publicVariable "monkey";
	
	newHunter = [ _unit, 1 ];
	publicVariable "newHunter";
	player globalChat "message sent";
	
};

_selPlr = floor(random (count playableUnits));
(playableUnits select _selPlr) call spawnNewPlaneFunc;

uiSleep 10;
execVM "preyRocketSpawner.sqf";
execVM "preyTracker.sqf";
execVM "hunterBombSpawner.sqf";
execVM "hunterFlareSpawner.sqf";

