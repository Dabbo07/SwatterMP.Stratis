_killed = _this select 0;
_killer = _this select 1;
if (clientIsPlayerHunter) then {
	player globalChat format["Killer %1 : %2", _killer, (isNil "_killer")];
	if (isNil "_killer" || _killer == player) then {
		player globalChat "No killer found";
		_killer = plr00;
		_killed = plr00;
	};
	uiSleep 12;
	hunterDeathMessage = [ _killed, _killer];
	publicVariableServer "hunterDeathMessage";
};
