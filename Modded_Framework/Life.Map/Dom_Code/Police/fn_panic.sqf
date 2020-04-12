/*
	File: fn_panic.sqf
	Author: Dom
	Description: Alerts all cops of the a panic request
*/
params [
	["_unit",objNull,[objNull]]
];

[format["Panic button pressed by %1.",name _unit],"red"] call DT_fnc_notify;
[_unit,"Mil_objective","PANIC","ColorRed",60] call DT_fnc_createMarker;