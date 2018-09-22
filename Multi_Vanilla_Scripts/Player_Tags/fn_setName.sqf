#include "..\..\script_macros.hpp"
/*
	File: fn_nameMenu.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Inserts the _unit's UID and desired name to players profileNamespace, either as a new or overwrite depending on if it existed before
*/

params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit) exitWith {};
private _uid = getPlayerUID _unit;

private _name = CONTROL(59000,1400);
_name = ctrlText _name;

if(count _name > 35) exitWith {hint "Name is too long."};

private _insertArr = [_uid,_name];

private _i = -1;
{
	_x params [
		["_oldUID","",[""]]
	];
	if (_oldUID isEqualTo _uid) exitWith {
		_i = _forEachIndex;
	};
} forEach (profileNamespace getVariable "DT_Names");

if (_i isEqualTo -1) then {
	_array pushBack _insertArr;
} else {
	_array set[_i,_insertArr];
};

profileNamespace setVariable ["DT_Names",_array];
closeDialog 0;
