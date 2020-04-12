/*
	File: fn_escort.sqf
	Author: Dom
	Description: Escorts target unit
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit] call DT_fnc_checkPlayer) exitWith {};
if !(isNull client_carrying) exitWith {["You're already carrying something.","orange"] call DT_fnc_notify};

client_carrying = _unit;
_unit attachTo [player,[0.5,0.3,0]];