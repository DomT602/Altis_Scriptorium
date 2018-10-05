/*
    File: fn_initArrestMenu.sqf
    Author: Dom
    Description: Opens and populates the menu to arrest a player
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit] call DT_fnc_checkPlayer) exitWith {};
if !(_unit getVariable ["restrained",false]) exitWith {["Person must be restrained."] call DT_fnc_notify};

createDialog "DT_arrestMenu";
private _nameBox = (findDisplay 1009) displayCtrl 1000;
private _name = ["Unknown",_unit] call DT_fnc_findName;

_nameBox ctrlSetStructuredText parseText format["<t align='center'>%1</t>",_name];