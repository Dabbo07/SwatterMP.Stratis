enableSaving [false, false];

plrMarkers = [ 
	"Mplr01", "Mplr02", "Mplr03", "Mplr04", "Mplr05", "Mplr06", "Mplr07", "Mplr08", "Mplr09", "Mplr10",
	"Mplr11", "Mplr12", "Mplr13", "Mplr14", "Mplr15", "Mplr16", "Mplr17", "Mplr18", "Mplr19", "Mplr20"
];		

{ 
	// Hides all player markers on initialisation.
	_x setMarkerShape "ICON";
} forEach plrMarkers;

if (isServer) then {
	execVM "serverInit.sqf";
};
if (!isServer || !(isNull player)) then {
	execVM "clientInit.sqf";
};



