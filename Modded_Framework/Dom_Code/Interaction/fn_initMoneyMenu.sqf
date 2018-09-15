/*
    File: fn_initMoneyMenu.sqf
    Author: Dom
    Description: Opens the give money menu
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit] call DT_fnc_checkPlayer) exitWith {["Invalid target.","red"] call DT_fnc_notify};
createDialog "DT_GiveMoney";

private _name = ["Unknown",_unit] call DT_fnc_findName;
private _display = findDisplay 1012;
private _textBox = _display displayCtrl 1100;
_textBox ctrlSetStructuredText parseText format["<t align='center'>Give money to: %1</t>",_name];