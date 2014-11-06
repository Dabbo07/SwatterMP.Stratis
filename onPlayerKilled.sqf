_killed = _this select 0;
_killer = _this select 1;

// TODO: Two calls happening in events, could be confusion on client/server on listen - force dedicated mode?

if (clientIsPlayerHunter) then {
	netMsgHunterKilled = [ player, _killed, _killer];
	player globalChat format["Killed(%1) Killer(%2)", _killed, _killer];
	publicVariableServer "netMsgHunterKilled";
	if (isServer) then {
		[] call handleNotificationFunc;
	};
};

// TODO: Add scoring for normal kills?
//if (_killer != player && !isNull _killer) then {
//	killerScored = _killer;
//	publicVariableServer "killerScored";
//};
