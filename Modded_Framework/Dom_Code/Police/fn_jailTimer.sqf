/*
    File: fn_jailTimer.sqf
    Author: Dom
    Description: Does some mad maths for a jail timer - a lot of effort
*/
params [
	["_time",300,[0]]
];

[4] call DT_fnc_saveStatsPartial;

private _seconds = 0;
private _minutes = 0;
private _hours = 0;
private _variable = (player getVariable ["jail_details",[]]);
_variable params ["","_reason","","_cell"];

for "_i" from _time to 0 step -1 do {
	if (jail_changedTime) exitWith {
		jail_changedTime = false;
		(player getVariable ["jail_details",[]]) params ["","","_newTime"];
		[_newTime] spawn DT_fnc_jailTimer;
	};
	if (player distance (getMarkerPos "Jail") > 50) exitwith {
		player setVariable ["jail_details",[0,"",0,""],true];
		["You escaped from the jail.","red"] call DT_fnc_notify;
		[4] call DT_fnc_saveStatsPartial
	};
	if (_i isEqualTo 0) exitWith {
		player setVariable ["jail_details",[0,"",0,""],true];
		["You were released from the jail.","green"] call DT_fnc_notify;
		player setPosATL (getMarkerPos "jail_release");
		player forceAddUniform "Released_Uniform";
		[4] call DT_fnc_saveStatsPartial
	};

	if (_i > 60) then {
		if (_i > 3600) then {
			_hours = floor(_i / 3600);
			_i = _i - (_hours * 3600);
			_seconds = _i mod 3600; //remainder seconds
			if (_seconds > 60) then {
				_minutes = floor(_seconds / 60);
				_seconds = _seconds mod 60; //remainder seconds
			};
		};
		_minutes = floor(_i / 60);
		_seconds = _i mod 60; //remainder seconds
	};

	if ((_i mod 600) isEqualTo 0) then {[4] call DT_fnc_saveStatsPartial};
	
	hint format["%1-%2-%3",_hours,_minutes,_seconds];
	_variable set [2,_i];
	uiSleep 1;
};