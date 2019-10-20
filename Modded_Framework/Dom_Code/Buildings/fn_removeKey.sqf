/*
	File: fn_givePermKey.sqf
	Author: Dom
	Description: Gives selected player a permanent house key
*/
params [
	["_house",objNull,[objNull]]
];

private _display = findDisplay 1029;
private _listbox = _display displayCtrl 1500;
private _index = lbCurSel _listbox;
if (_index isEqualTo -1) exitWith {["Nothing selected.","orange"] call DT_fnc_notify};
private _uid = _listbox lbData _index;
private _keys = _house getVariable ["houseKeys",[]];
private _toRemove = _keys findIf {_uid isEqualTo (_x select 0)};
if (_toRemove != -1) then {
	_listbox lbDelete _index;
	_keys deleteAt _toRemove;
	_house setVariable ["houseKeys",_keys,true];
	["Key successfully removed.","green"] call DT_fnc_notify;
	[_house] remoteExecCall ["DB_fnc_keyChange",2];
};