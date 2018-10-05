/*
	File: fn_findName.sqf
	Author: Dom
	Description: Finds a name within profilenamespace
*/

params [
	["_name","unknown",[""]],
	["_unit",objNull,[objNull]]
];

private _uid = getPlayerUID _unit;
{
	_x params [
		["_sUID","",[""]],
		["_sName","",[""]]
	];
	if (_sUID isEqualTo _uid) exitWith {
		_name = _sName;
	};
} forEach (profileNamespace getVariable "DT_Names");
_name;