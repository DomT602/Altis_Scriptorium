/*
	File: fn_switchDuty.sqf
	Author: Dom
	Description: Switches player on or off duty
*/
params [
	["_faction","",[""]]
];

if (_faction isEqualTo "") exitWith {};

private _factionRank = switch _faction do {
	case "cop": {player getVariable ["cop_rank",0]};
	case "medic": {player getVariable ["medic_rank",0]};
};

if (_factionRank isEqualTo 0) exitWith {
	["You do not work here.","orange"] call DT_fnc_notify;
};

call DT_fnc_saveStatsFull;
if ((player getVariable ["faction","civ"]) isEqualTo _faction) then {
	[getPlayerUID player,"civ"] remoteExecCall ["DB_fnc_recieveFactionGear",2];
	["You went off duty.","blue"] call DT_fnc_notify;
	player setVariable ["copLevel",nil,true];
	if (player getVariable ["dispatch",false]) then {
		player setVariable ["dispatch",nil,true];
	};
	switch (player getVariable ["doj_rank",0]) do {
		case 0: {client_paycheck = 0};
		case 1: {client_paycheck = 1000};
		case 2: {client_paycheck = 1500};
		case 3: {client_paycheck = 1500};
		case 4: {client_paycheck = 2000};
		case 5: {client_paycheck = 2500};
	};
} else {
	[getPlayerUID player,_faction] remoteExecCall ["DB_fnc_recieveFactionGear",2];
};	