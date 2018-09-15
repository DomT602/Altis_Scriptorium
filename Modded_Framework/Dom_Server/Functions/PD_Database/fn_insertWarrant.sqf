/*
	File: fn_insertWarrant.sqf
	Author: Dom
	Description: Inserts warrant into the DB
*/

params [
	["_name","",[""]],
	["_crimes","",[""]],
	["_officer","",[""]],
	["_notes","",[""]],
	["_type",0,[0]]
];

[format["insertWarrant:%1:%2:%3:%4:%5",_name,_crimes,_officer,_notes,_type],1] call MySQL_fnc_DBasync;

private _return = ["populateWarrants",2] call MySQL_fnc_DBasync;
if !(_return isEqualTo []) then {
	warrant_list = _return
} else {
	warrant_list = []
};
publicVariable "warrant_list";