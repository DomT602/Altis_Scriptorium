/*
	File: fn_findName.sqf
	Author: Dom
	Description: Finds a name within profilenamespace
*/

params [
	["_name","unknown",[""]],
	["_unit",objNull,[objNull]]
];

{
	_x params [
		["_uid","",[""]],
		["_sName","",[""]]
	];
	if (_uid isEqualTo getPlayerUID _unit) exitWith {
		_name = _sName;
	};
} forEach (profileNamespace getVariable "DT_Names");
_name;