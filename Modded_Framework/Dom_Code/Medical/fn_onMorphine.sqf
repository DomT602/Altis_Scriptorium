/*
	File: fn_onMorphine.sqf
	Author: Dom
	Description: Handles being on morphine
*/

["Morphine will last 5 minutes, or until your downed."] call DT_fnc_notify;
player setVariable ["morphine",true,true];

[
	{
		player getVariable ["dead",false]
	},
	{
		player setVariable ["morphine",false,true];
	},
	[],
	300,
	{
		player setVariable ["morphine",false,true];
	}
] call CBA_fnc_waitUntilAndExecute;