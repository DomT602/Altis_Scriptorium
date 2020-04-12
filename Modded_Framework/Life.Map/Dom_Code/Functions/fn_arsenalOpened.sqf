/*
	File: fn_arsenalOpened.sqf
	Author: Dom
	Description: Called when arsenal is opened
*/
params [
	["_display",displayNull,[displayNull]]
];

_display closeDisplay 2;
[player,"Attempted to open arsenal"] remoteExecCall ["server_fnc_logAction",2];