/*
	File: fn_findJobPerson.sqf
	Author: Dom
	Description: Finds players of a certain job online
*/
params [
	["_job","",[""]]
];

private _units = [];
{
	if (player getVariable ["job",""] isEqualTo _job) then {
		_units pushBack _x
	};
} forEach playableUnits;
_units