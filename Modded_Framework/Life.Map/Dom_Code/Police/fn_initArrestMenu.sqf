/*
	File: fn_initArrestMenu.sqf
	Author: Dom
	Description: Opens and populates the menu to arrest a player
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit,true] call DT_fnc_checkPlayer) exitWith {};
if !(_unit getVariable ["restrained",false]) exitWith {["Person must be restrained."] call DT_fnc_notify};

createDialog "DT_arrestMenu";