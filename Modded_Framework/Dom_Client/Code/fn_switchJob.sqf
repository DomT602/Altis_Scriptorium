/*
    File: fn_switchJob.sqf
    Author: Dom
    Description: Switches player on or off duty
*/
params [
	"",
	["_caller",objNull,[objNull]],
	"",
	["_job","",[""]]
];

[_caller,_job] call DT_fnc_switchJob;