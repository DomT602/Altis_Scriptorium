/*
	File: fn_initMoneyMenu.sqf
	Author: Dom
	Description: Opens the give money menu
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit,true] call DT_fnc_checkPlayer) exitWith {};
createDialog "DT_giveMoney";

private _name = ["Unknown",_unit] call DT_fnc_findName;
private _display = findDisplay 1012;
private _textBox = _display displayCtrl 1100;
_textBox ctrlSetStructuredText parseText format["Give money to: %1",_name];