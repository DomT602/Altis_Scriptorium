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
if (player distance _unit > 5) exitWith {["Intoxication check failed - target moved too far away.","orange"] call DT_fnc_notify};

[format["Intoxication level: %1.",(_unit getVariable ["intoxication",0])],"green"] call DT_fnc_notify; //or make it say over the limit after 0.2?