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
private _names = profileNamespace getVariable ["DT_Names",[]];
private _index = _names findIf {_x select 0 isEqualTo _uid};

if (_index != -1) then {
	_name = (_names select _index) select 1;
};
_name;