/*
    File: fn_arrestPlayer.sqf
    Author: Dom
    Description: Arrests the player
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit] call DT_fnc_checkPlayer) exitWith {};
if !(_unit getVariable ["restrained",false]) exitWith {["Person must be restrained."] call DT_fnc_notify; closeDialog 0};

private _display = findDisplay 1009;
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

//private _cells = [["A01",[0,0,0]],["A02",[0,0,0]]]; //cell name, location
//(selectRandom _cells) params ["_cell"];

_unit setVariable ["jail_details",[1,_crimes,_time,""],true];
_unit setPosATL (getMarkerPos "Jail_Default");
_unit setVariable ["restrained",false,true];

[_time] remoteExec ["DT_fnc_jailTimer",_unit];
