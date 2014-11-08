clientIsPlayerHunter = false;

spawnHunterPlane = {
	// Spawns a new A164 jet at random spawn entry, returns jet object.
	_rMarker = floor(random 6);
	_rMarkerName = format["spawn0%1", _rMarker];
	_spawnPos = getMarkerPos _rMarkerName;
	_hunterPlane = "B_Plane_CAS_01_F" createVehicle _spawnPos;
	_hunterPlane setposATL [_spawnPos select 0, _spawnPos select 1, 800];
	_hunterPlane setDir markerDir _rMarkerName;
	_hunterPlane flyInHeight 800;
	_hunterPlane engineOn true;

	_hunterPlane removeWeaponTurret ["Gatling_30mm_Plane_CAS_01_F", [0-1]];
	_hunterPlane removeWeaponTurret ["Missile_AA_04_Plane_CAS_01_F", [0-1]];
	_hunterPlane removeWeaponTurret ["Missile_AGM_02_Plane_CAS_01_F", [0-1]];
	_hunterPlane removeWeaponTurret ["Rocket_04_HE_Plane_CAS_01_F", [0-1]];
	_hunterPlane removeWeaponTurret ["Rocket_04_AP_Plane_CAS_01_F", [0-1]];
	_hunterPlane lock true;

	_vel = velocity _hunterPlane;
	_dir = markerDir _rMarkerName;
	_speed = 100;
	_hunterPlane setVelocity [
		(_vel select 0) + (sin _dir * _speed),
		(_vel select 1) + (cos _dir * _speed),
		(_vel select 2)
	];
	_hunterPlane;
};

"hunterSpawnMessage" addPublicVariableEventHandler {
	// Message from serverInit.sqf (when new hunter is selected);
	_newHunter = hunterSpawnMessage select 0;
	_oldHunter = hunterSpawnMessage select 1;

	player globalChat format["DEBUG : %1 : %2 : %3", _newHunter, _oldHunter, hunterPlane];
	
	if (_newHunter == player) then {
		player globalChat "New Hunter!";
		clientIsPlayerHunter = true;
		hunterPlane = call spawnHunterPlane;
		publicVariable "hunterPlane";
		player moveInDriver hunterPlane;
	} else {
		clientIsPlayerHunter = false;
	};
	if (_oldHunter == plr00) then {
		[
			format["<t align='center' shadow='1' size='1.2'>%1 : is the new Hunter</t><br/><t align='center' shadow='1' size='0.6'>No killer responsible, randomily selected.</t>", name _newHunter],
			0, 0,
			8, 2
		] spawn BIS_fnc_dynamicText;
	} else {
		[
			format["<t align='center' shadow='1' size='1.2'>%1 : is the new Hunter</t><br/><t align='center' shadow='1' size='0.6'>The last hunter; %2 was killed by %1</t>", name _newHunter, name _oldHunter],
			0, 0,
			8, 2
		] spawn BIS_fnc_dynamicText;
	};
};

// Respawn initialisation (every spawn).
player addEventHandler [
	"Respawn",
	{
		private ["_unit"];
		_unit = _this select 0;
		
		_unit enableFatigue false; 
		
		_rx = (getMarkerPos "spawnPrey") select 0;
		_ry = (getMarkerPos "spawnPrey") select 1;
		_rx = _rx - 700 + floor(random(1400));
		_ry = _ry - 700 + floor(random(1400));
		
		_unit setPos [_rx, _ry, 0 ];
		
		removeAllWeapons _unit;
		_unit addBackpack "B_Carryall_Base";
		_unit addMagazine "200Rnd_65x39_cased_Box_Tracer";
		_unit addMagazine "200Rnd_65x39_cased_Box_Tracer";
		_unit addWeapon "LMG_Mk200_MRCO_F";
		_unit addMagazine "Titan_AA";
		_unit addMagazine "Titan_AA";
		_unit addWeapon "launch_B_Titan_F";
		clientIsPlayerHunter = false;
	}
];

// Welcome Message
uiSleep 2;
[
	"<t align='center' shadow='1' size='1.2'>Welcome to Swatter</t><br/><t align='center' shadow='1' size='0.5'>Version 0.01</t><br/><br/><br/><br/><t align='center' shadow='1' size='0.8'>The match will begin shortly and the<br/>first hunter will be randomly chosen.</t>",
	0, 0,
	8, 2
] spawn BIS_fnc_dynamicText;





















// OLD CODE BELOW


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
	clientIsPlayerHunter = true;
};

player addEventHandler [
	"Respawn",
	{
		private ["_unit"];
		_unit = _this select 0;
		
		_unit enableFatigue false; 
		
		_rx = (getMarkerPos "spawnPrey") select 0;
		_ry = (getMarkerPos "spawnPrey") select 1;
		_rx = _rx - 700 + floor(random(1400));
		_ry = _ry - 700 + floor(random(1400));
		
		_unit setPos [_rx, _ry, 0 ];
		
		removeAllWeapons _unit;
		_unit addBackpack "B_Carryall_Base";
		_unit addMagazine "200Rnd_65x39_cased_Box_Tracer";
		_unit addMagazine "200Rnd_65x39_cased_Box_Tracer";
		_unit addWeapon "LMG_Mk200_MRCO_F";
		_unit addMagazine "Titan_AA";
		_unit addMagazine "Titan_AA";
		_unit addWeapon "launch_B_Titan_F";
		clientIsPlayerHunter = false;
	}
];

"netMsgNewHunter" addPublicVariableEventHandler {
	// Will not trigger on listen server/client.
	netMsgNewHunter call clientHunterMessage;
	if ((netMsgNewHunter select 0) == player) then {
		call spawnNewPlaneFunc;
	};
};

uiSleep 2;
[
	"<t align='center' shadow='1' size='1.2'>Welcome to Swatter</t><br/><t align='center' shadow='1' size='0.5'>Version 0.01</t><br/><br/><br/><br/><t align='center' shadow='1' size='0.8'>The match will begin shortly and the<br/>first hunter will be randomly chosen.</t>",
	0, 0,
	8, 2
] spawn BIS_fnc_dynamicText;

uiSleep 5;
execVM "preyRocketSpawner.sqf";
execVM "hunterBombSpawner.sqf";
execVM "hunterFlareSpawner.sqf";
