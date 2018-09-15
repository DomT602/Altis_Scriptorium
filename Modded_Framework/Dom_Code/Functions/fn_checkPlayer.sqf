/*
    File: fn_checkPlayer.sqf
    Author: Dom
    Description: Series of checks to see if a target is valid if !([_unit] call DT_fnc_checkPlayer) exitWith {["Invalid target.","red"] call DT_fnc_notify};
*/
params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit) exitWith {false};
if !(isPlayer _unit) exitWith {false};
if (player distance _unit > 4) exitWith {false};
true;