
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

	}
];

"netMsgNewHunter" addPublicVariableEventHandler {
	// Will not trigger on listen server/client.
	netMsgNewHunter call clientHunterMessage;
};

uiSleep 2;
[
	"<t align='center' shadow='1' size='1.2'>Welcome to Swatter</t><br/><t align='center' shadow='1' size='0.5'>Version 0.01</t><br/><br/><br/><br/><t align='center' shadow='1' size='0.8'>The match will begin shortly and the<br/>first hunter will be randomly chosen.</t>",
	0, 0,
	8, 2
] spawn BIS_fnc_dynamicText;

