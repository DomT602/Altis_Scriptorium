/*
    File: fn_robStore.sqf
    Author: Dom
    Description: Switches player on or off duty
*/
params [
	["_target",objNull,[objNull]],
	["_caller",objNull,[objNull]],
	["_ID",-1,[0]],
	["_arguments",[10,50,500,""],[[]]]
];

[_target,_caller,_ID,_arguments] call DT_fnc_robStore;