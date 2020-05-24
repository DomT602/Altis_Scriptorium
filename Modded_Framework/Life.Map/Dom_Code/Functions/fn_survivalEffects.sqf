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
	player setVariable ["hunger",_newValue,true];

	if (_newValue isEqualTo 0) then {
		[player] call DT_fnc_onPlayerKilled
	} else {
		if (_newValue < 25) then {
			["You are starving!","red"] call DT_fnc_notify;
		};
	};
	[_type] call DT_fnc_updateHUDPartial;
};

if (_type isEqualTo "thirst") exitWith {
	private _oldValue = player getVariable ["thirst",100];
	private _newValue = (_oldValue - 10) max 0;
	player setVariable ["thirst",_newValue,true];
	
	if (_newValue isEqualTo 0) then {
		[player] call DT_fnc_onPlayerKilled
	} else {
		if (_newValue < 25) then {
			["You are dying of dehydration!","red"] call DT_fnc_notify;
		};
	};
	[_type] call DT_fnc_updateHUDPartial;
};

if (_type isEqualTo "battery") exitWith {
	private _battery = player getVariable ["phoneBattery",100];
	if (_battery > 0) then {
		player setVariable ["phoneBattery",(_battery - 1) min 100,[clientOwner,2]];
	};
};

if (_type isEqualTo "paycheck") exitWith {
	private _compSalary = player getVariable ["companySalary",0];
	if (client_paycheck > 0 || _compSalary > 0) then {
		if (player getVariable ["job",""] isEqualTo "lawyer" && {player distance (getMarkerPos "courthouse") > 50}) exitWith {
			["You missed your paycheck.","red"] call DT_fnc_notify;
		};
		if (client_paycheck > 0) then {
			["bank",client_paycheck] call DT_fnc_handleMoney;
			[format["You recieved your paycheck of $%1.",client_paycheck],"green"] call DT_fnc_notify;
		};
		if (_compSalary > 0) then {
			[(player getVariable ["company",""]),10,_compSalary] remoteExecCall ["DB_fnc_updateCompany",2];
		};
	} else {
		if (((player getVariable ["cash",0]) + (player getVariable ["bank",0])) < 5000) then {
			["bank",500] call DT_fnc_handleMoney;
			["You recieved a welfarecheck of $500.","green"] call DT_fnc_notify;
		};
	};
};