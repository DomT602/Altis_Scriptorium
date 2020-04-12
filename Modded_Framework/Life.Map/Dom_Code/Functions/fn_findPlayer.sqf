/*
	File: fn_findPlayer.sqf
	Author: Dom
	Description: Gets player object if uid matches
*/
params [
	["_uid","",[""]]
];

private _unit = objNull;
{
	if (_uid isEqualTo getPlayerUID _x) exitWith {
		_unit = _x;
	};
} forEach playableUnits;
_unit