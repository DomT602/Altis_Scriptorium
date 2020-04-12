/*
	File: fn_keyChange.sqf
	Author: Dom
	Description: Changes permanent key status of a house
*/
params [
	["_house",objNull,[objNull]]
];

private _keys = _house getVariable ["houseKeys",[]];
private _id = _house getVariable ["id",-1];
[format["updateKeys:%1:%2",_keys,_id],1] call MySQL_fnc_DBasync;