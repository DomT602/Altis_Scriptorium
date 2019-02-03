/*
	File: fn_recieveFactionGear.sqf
	Author: Dom
	Description: Recieves faction gear depending on NPC visited
*/
params [
	["_uid","",[""]],
	["_faction","civ",[""]]
];

private _query = switch _faction do {
	case "cop": {
		[format["selectCop:%1",_uid],2] call MySQL_fnc_DBasync;
	};
	case "medic": {
		[format["selectMedic:%1",_uid],2] call MySQL_fnc_DBasync;
	};
	case "civ": {
		[format["selectCiv:%1",_uid],2] call MySQL_fnc_DBasync;
	};
};

_query params [
	["_gear",[],[[]]],
	["_department",0,[0]]
];

switch _faction do {
	case "cop": {
		_department = switch _department do {
			case 0: {"Patrol"};
			case 1: {"Department of Corrections"};
			case 2: {"Highway Patrol"};
			case 3: {"SWAT"};
			case 4: {"DTU"};
		};
	};
	case "medic": {
		_department = switch _department do {
			case 0: {"EMS"};
			case 1: {"Search and Rescue"};
			case 2: {"Fire Department"};
		};
	};
	case "civ": {
		_department = "";
	};
};

[_gear,_faction,_department] remoteExecCall ["DT_fnc_recieveGear",remoteExecutedOwner];
