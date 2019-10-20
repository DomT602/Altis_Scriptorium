/*
	File: fn_onMorphine.sqf
	Author: Dom
	Description: Handles being on morphine
*/

["Morphine will last 5 minutes, or until your downed."] call DT_fnc_notify;
player setVariable ["morphine",true,false];

[
	{
		player getVariable ["dead",false]
	},
	{
		player setVariable ["morphine",false,false];
	},
	0,
	300,
	{
		player setVariable ["morphine",false,false];
	}
] call CBA_fnc_waitUntilAndExecute;