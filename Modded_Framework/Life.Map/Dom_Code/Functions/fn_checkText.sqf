/*
	File: fn_checkText.sqf
	Author: Dom
	Description: Validates text (checks for :[])
*/
params [
	["_text","",[""]]
];

private _characters = [":","[","]"];
private _return = false;
{
	if (_text find _x != -1) exitWith {
		["Invalid character entered.","orange"] call DT_fnc_notify;
		_return = true;
	};
} forEach _characters;
_return;