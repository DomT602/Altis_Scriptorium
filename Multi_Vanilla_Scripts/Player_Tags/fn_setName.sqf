#include "..\..\script_macros.hpp"
/*
	File: fn_nameMenu.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Inserts the _unit's UID and desired name to players profileNamespace, either as a new or overwrite depending on if it existed before
*/
params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit || {!isPlayer _unit}) exitWith {};
private _uid = getPlayerUID _unit;

private _name = CONTROL(59000,1400);
_name = ctrlText _name;
closeDialog 0;

private _insertArr = [_uid,_name];
private _array = profileNamespace getVariable ["DT_Names",[]];
private _i = _array findIf {(_x param [0,""]) isEqualTo _uid};

if (_i isEqualTo -1) then {
	_array pushBack _insertArr;
} else {
	_array set [_i,_insertArr];
};

profileNamespace setVariable ["DT_Names",_array];
