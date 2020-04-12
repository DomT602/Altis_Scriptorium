/*
	File: fn_updateJailTime.sqf
	Author: Dom
	Description: Adjusts players jail time
*/
params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit || {!isPlayer _unit}) exitWith {};

private _display = findDisplay 1010;
private _hours = ctrlText (_display displayCtrl 1400);
if !([_hours] call DT_fnc_checkNumber) exitWith {};
_hours = parseNumber _hours;
private _minutes = ctrlText (_display displayCtrl 1401);
if !([_minutes] call DT_fnc_checkNumber) exitWith {};
_minutes = parseNumber _minutes;
private _seconds = ctrlText (_display displayCtrl 1402);
if !([_seconds] call DT_fnc_checkNumber) exitWith {};
_seconds = parseNumber _seconds;
private _crimes = ctrlText (_display displayCtrl 1403);
closeDialog 0;

private _time = _seconds + (_minutes * 60) + (_hours * 3600);

_unit setVariable ["jailStats",[true,_crimes,_time,""],true];