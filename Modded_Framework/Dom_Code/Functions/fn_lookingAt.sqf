/*
	File: fn_lookingAt.sqf
	Author: Dom
	Description: Returns true/false depending on whether on whether player is looking at certain objects
*/
params [
	["_object",objNull,[objNull]],
	["_toFind","",[""]],
	["_distance",2.5,[0]]
];

if ((str(_object) find _toFind != -1) && player distance _object < _distance) exitWith {true};
false;