enableSaving [false, false];

plrMarkers = [ 
	"Mplr01", "Mplr02", "Mplr03", "Mplr04", "Mplr05", "Mplr06", "Mplr07", "Mplr08", "Mplr09", "Mplr10",
	"Mplr11", "Mplr12", "Mplr13", "Mplr14", "Mplr15", "Mplr16", "Mplr17", "Mplr18", "Mplr19", "Mplr20"
];		

// Hides all player markers on initialisation.
{ 
	_x setMarkerShape "ICON";
} forEach plrMarkers;

clientIsPlayerHunter = false;

clientHunterMessage = {
	// Created on server and client, to support listen server/client.
	private ["_netMsg"];
	_netMsg = _this;
	_newHunter = name (_netMsg select 0);
	_lastHunter = name (_netMsg select 1);
	if ((_netMsg select 1) == plr00) then { // No killer set.
		[
			format["<t align='center' shadow='1' size='1.2'>%1 : is the new Hunter</t><br/><t align='center' shadow='1' size='0.6'>No killer responsible, randomily selected.</t>", _newHunter],
			0, 0,
			8, 2
		] spawn BIS_fnc_dynamicText;
	} else {
		[
			format["<t align='center' shadow='1' size='1.2'>%1 : is the new Hunter</t><br/><t align='center' shadow='1' size='0.6'>The last hunter; %2 was killed by %1</t>", _newHunter, _lastHunter],
			0, 0,
			8, 2
		] spawn BIS_fnc_dynamicText;
	};
	if ((_netMsg select 0) == player) then {
		clientIsPlayerHunter = true;
	} else {
		clientIsPlayerHunter = false;
	};
};

if (isServer) then {
	uiSleep 2;
	[
		"<t align='center' shadow='1' size='1.2'>Welcome to Swatter</t><br/><t align='center' shadow='1' size='0.5'>Version 0.01</t><br/><br/><br/><br/><br/><br/><br/><t align='center' shadow='1' size='0.8'>Listen Servers are not supported yet.<br/>Please install mission file onto a dedicated server.</t>",
		0, 0,
		8, 2
	] spawn BIS_fnc_dynamicText;
	"end2" call BIS_fnc_endMission;
} else {
	if (isDedicated) then {
		execVM "serverInit.sqf";
	};
	if (!isDedicated || !(isNull player)) then {
		execVM "clientInit.sqf";
	};
};



