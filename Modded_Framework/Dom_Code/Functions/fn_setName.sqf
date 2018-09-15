/*
	File: fn_nameMenu.sqf
	Author: Dom
	Description: Inserts the _unit's UID and desired name to players profileNamespace, either as a new or overwrite depending on if it existed before
*/

params [
	["_unit",objNull,[objNull]]
];

if(isNull _unit) exitWith {};
private _uid = getPlayerUID _unit;
if (_uid isEqualTo "") exitWith {};
private _name = (findDisplay 1004) displayCtrl 1400;

_name = ctrlText _name;

if (count _name > 50) exitWith {["Name is too long.","red"] call DT_fnc_notify};

private _insertArr = [_uid,_name];

private _array = profileNamespace getVariable "DT_Names";
private _i = -1;
{
	_x params [
		["_oldUID","",[""]]
	];
	if (_oldUID isEqualTo _uid) exitWith {
		_i = _forEachIndex;
	};
} forEach _array;

if (_i isEqualTo -1) then {
	_array pushBack _insertArr;
} else {
	_array set[_i,_insertArr];
};

profileNamespace setVariable ["DT_Names",_array];
closeDialog 0;