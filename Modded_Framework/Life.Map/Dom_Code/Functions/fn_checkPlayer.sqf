/*
	File: fn_checkPlayer.sqf
	Author: Dom
	Description: Series of checks to see if a target is valid if !([_unit] call DT_fnc_checkPlayer) exitWith {};
*/
params [
	["_unit",objNull,[objNull]],
	["_checkDead",false,[false]],
	["_distance",4,[0]]
];

if (isNull _unit) exitWith {["No target.","red"] call DT_fnc_notify; false};
if !(isPlayer _unit) exitWith {["Invalid target.","red"] call DT_fnc_notify; false};
if (player distance _unit > _distance) exitWith {["Target is too far away.","red"] call DT_fnc_notify; false};
if (_checkDead && {player getVariable ["dead",false]}) exitWith {["Target is dead.","red"] call DT_fnc_notify; false};
true