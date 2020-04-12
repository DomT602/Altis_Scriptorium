/*
	File: fn_switchDuty.sqf
	Author: Dom
	Description: Switches player on or off duty
*/
params [
	["_faction","",[""]]
];
if (_faction isEqualTo "") exitWith {};

private _factionRank = player getVariable [format["%1Rank",_faction],0];
if (_factionRank isEqualTo 0) exitWith {
	["You do not work here.","orange"] call DT_fnc_notify;
};

[1] call DT_fnc_saveStatsPartial;
if ((player getVariable ["faction","civ"]) isEqualTo _faction) then {
	[getPlayerUID player,"civ"] remoteExecCall ["DB_fnc_recieveFactionGear",2];
	["You went off duty.","blue"] call DT_fnc_notify;
	player setVariable ["copLevel",0,true];
	if (player getVariable ["dispatch",false]) then {
		player setVariable ["dispatch",nil,true];
	};
	client_paycheck = switch (player getVariable ["dojRank",0]) do {
		case 0: {0};
		case 1: {1000};
		case 2: {1500};
		case 3: {1500};
		case 4: {2000};
		case 5: {2500};
	};
} else {
	[getPlayerUID player,_faction] remoteExecCall ["DB_fnc_recieveFactionGear",2];
};	