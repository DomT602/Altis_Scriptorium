/*
	File: fn_nameMenu.sqf
	Author: Dom
	Description: Inserts the _unit's UID and desired name to players profileNamespace, either as a new or overwrite depending on if it existed before
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit] call DT_fnc_checkPlayer) exitWith {};
private _uid = getPlayerUID _unit;
private _name = ctrlText ((findDisplay 1004) displayCtrl 1400);

if (count _name > 50) exitWith {["Name is too long.","red"] call DT_fnc_notify};

closeDialog 0;
private _insertArr = [_uid,_name];

private _array = profileNamespace getVariable ["DT_Names",[]];
private _index = _array findIf {(_x param [0,""]) isEqualTo _uid};

if (_index isEqualTo -1) then {
	_array pushBack _insertArr;
} else {
	_array set [_index,_insertArr];
};

profileNamespace setVariable ["DT_Names",_array];