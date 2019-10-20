/*
	File: fn_intoxCheck.sqf
	Author: Dom
	Description: Checks the level of intoxication of the target
*/
params [
	["_unit",objNull,[objNull]]
];

["Initiating intoxication check...","blue",3] call DT_fnc_notify;
[
	{
		params ["_unit"];
		if !([_unit,true] call DT_fnc_checkPlayer) exitWith {};
		[format["Intoxication level: %1.",(_unit getVariable ["intoxication",0])],"green"] call DT_fnc_notify;
	},
	_unit,
	3
] call CBA_fnc_waitAndExecute;