/*
	File: fn_findPlayers.sqf
	Author: Dom
	Description: Finds players of a certain faction online, e.g _cops = ["cop"] call DT_fnc_findPlayers;
*/
params [
	["_side","cop",[""]]
];

private _units = [];
{
	if (_x getVariable ["faction","civ"] isEqualTo _side) then {
		_units pushBack _x
	};
} forEach playableUnits;
_units