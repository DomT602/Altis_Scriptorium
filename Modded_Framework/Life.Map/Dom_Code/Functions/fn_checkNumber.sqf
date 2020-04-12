/*
	File: fn_checkNumber.sqf
	Author: Dom
	Description: Validates a number if !([_number,0] call DT_fnc_checkNumber) exitWith {};
*/
params [
	["_number","",[""]],
	["_lowest",-5,[0]]
];

private _parsed = parseNumber _number;
if (_number != str(_parsed)) exitWith {["Invalid number.","red"] call DT_fnc_notify; false};
if (_lowest != -5) exitWith {
	if (_parsed > _lowest) exitWith {true};
	[format["You need to enter a number greater then %1.",_lowest],"orange"] call DT_fnc_notify;
	false
};
true