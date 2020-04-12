/*
	File: fn_updateWarrant.sqf
	Author: Dom
	Description: Updates the status of a warrant and updates DB accordingly
*/
params [
	["_action","",[""]],
	["_index",0,[0]],
	["_name","",[""]]
];

(warrant_list select _index) params ["_id"];
switch _action do {
	case "complete": {[format["completeWarrant:%1:%2",_name,_id],1] call MySQL_fnc_DBasync};
	case "approve": {[format["updateWarrant:%1:%2",_name,_id],1] call MySQL_fnc_DBasync};
	case "remove": {[format["removeWarrant:%1",_id],1] call MySQL_fnc_DBasync};
};

[0] call DB_fnc_fetchData;