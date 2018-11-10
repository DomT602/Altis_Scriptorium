/*
	File: fn_intoxCheck.sqf
	Author: Dom
	Description: Checks the level of intoxication of the target
*/
params [
	["_unit",objNull,[objNull]]
];

["Initiating intoxication check...","blue",3] call DT_fnc_notify;
uiSleep 3;
if !([_unit] call DT_fnc_checkPlayer) exitWith {};

[format["Intoxication level: %1.",(_unit getVariable ["intoxication",0])],"green"] call DT_fnc_notify; //or make it say over the limit after 0.2?