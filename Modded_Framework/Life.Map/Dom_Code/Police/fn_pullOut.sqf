/*
	File: fn_pullOut.sqf
	Author: Dom
	Description: Pulls out all occupants of a vehicle
*/
params [
	["_vehicle",objNull,[objNull]]
];

{
	_x action ["Eject",_vehicle];
} forEach crew _vehicle;