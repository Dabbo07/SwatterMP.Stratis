
player addEventHandler [
	"Respawn",
	{
		private ["_unit"];
		_unit = _this select 0;
		
		removeAllWeapons _unit;
		_unit addBackpack "B_Carryall_Base";
		_unit addMagazine "200Rnd_65x39_cased_Box_Tracer";
		_unit addMagazine "200Rnd_65x39_cased_Box_Tracer";
		_unit addWeapon "LMG_Mk200_MRCO_F";
		_unit addMagazine "Titan_AA";
		_unit addMagazine "Titan_AA";
		_unit addWeapon "launch_B_Titan_F";

		sleep 5;
		
		"monkey" addPublicVariableEventHandler {
			player globalChat "Woop";
		};

		"newHunter" addPublicVariableEventHandler {
			player globalChat "New Message received";
			_hunterName = _this select 1 select 0;
			uiSleep 1;
			[
				format["<t align='center' shadow='1' size='1.2'>%1 : is the new Hunter</t>", _hunterName],
				0, 0,
				8, 2
			] spawn BIS_fnc_dynamicText;
		};
		
	}
];

//	["Welcome to Swatter Multiplayer", "<t align = 'center' shadow = '1' size = '2' font='PuristaBold'>%1</t><br/>"],
//	["Let the HUNT begin!", "<t align = 'center' shadow = '1' size = '1' font='PuristaBold' >%1</t><br/>"]


uiSleep 3;

[
	"<t align='center' shadow='1' size='1.2'>Welcome to Swatter</t><br/><t align='center' shadow='1' size='0.5'>Version 0.01</t><br/><br/><br/><br/><t align='center' shadow='1' size='0.8'>The match will begin shortly and the<br/>first hunter will be randomly chosen.</t>",
	0, 0,
	8, 2
] spawn BIS_fnc_dynamicText;

//[
//	[
//		["Welcome to Swatter Multiplayer", "<t align='center' shadow='1' size='1.2'>%1</t><br/>", 2],
//		["Version 0.01", "<t align='center' shadow='1' size='.5'>%1</t>", 5],
//		["<br/><br/>Get ready for the HUNT!", "<t align='center' shadow='1' size='.8'>%1</t>", 8]
//	], 
//	0, 0.2, "<t align='center' shadow='1' size='1'>%1</t>"
//] spawn BIS_fnc_typeText;
//
