// *** NOT USED ***

clientHunterCheck = plr00;

while {true} do {
	uiSleep .5;

	if (!isNil "newHunter") then {
		_newHunter = newHunter select 0;
		_lastHunter = newHunter select 1;
		if (clientHunterCheck != _newHunter) then {
			uiSleep 2;
			if (_lastHunter == plr00) then {
				[
					format["<t align='center' shadow='1' size='1.2'>%1 : is the new Hunter</t><br/>No killer responsible, randomily selected.", _newHunter],
					0, 0,
					8, 2
				] spawn BIS_fnc_dynamicText;
			} else {
				[
					format["<t align='center' shadow='1' size='1.2'>%1 : is the new Hunter</t><br/>Who killed the last hunter : %2", _newHunter, _lastHunter],
					0, 0,
					8, 2
				] spawn BIS_fnc_dynamicText;
			};
			clientHunterCheck = _newHunter;
		};
	};

};