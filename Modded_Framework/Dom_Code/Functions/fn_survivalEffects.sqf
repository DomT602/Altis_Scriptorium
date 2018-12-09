/*
	File: fn_survivalEffects.sqf
	Author: Dom
	Description: Handles various survival related features
*/
params [
	["_type","hunger",[""]]
];
if (player getVariable ["dead",false]) exitWith {};

if (_type isEqualTo "hunger") exitWith {
	private _oldValue = player getVariable ["hunger",100];
	private _newValue = (_oldValue - 10) max 0;
	player setVariable ["hunger",_newValue,-2];

	if (_newValue isEqualTo 0) then {
		[player] call DT_fnc_onPlayerKilled
	} else {
		if (_newValue < 15) then {
			["You are starving!","red"] call DT_fnc_notify;
		};
	};
};

if (_type isEqualTo "thirst") exitWith {
	private _oldValue = player getVariable ["thirst",100];
	private _newValue = (_oldValue - 10) max 0;
	player setVariable ["thirst",_newValue,-2];
	
	if (_newValue isEqualTo 0) then {
		[player] call DT_fnc_onPlayerKilled
	} else {
		if (_newValue < 15) then {
			["You are dying of dehydration!","red"] call DT_fnc_notify;
		};
	};
};

if (_type isEqualTo "battery") exitWith {
	if (phone_battery > 0) then {
		phone_battery = (phone_battery - 1) min 100;
	};
};

if (_type isEqualTo "paycheck") exitWith {
	if (client_paycheck > 0) then {
		if (player getVariable ["job",""] isEqualTo "lawyer" && {player distance (getMarkerPos "courthouse") > 50}) exitWith {
			["You missed your paycheck.","red"] call DT_fnc_notify;
		};
		client_bank = client_bank + client_paycheck;
		[format["You recieved your paycheck of $%1.",client_paycheck],"green"] call DT_fnc_notify;
	};
};