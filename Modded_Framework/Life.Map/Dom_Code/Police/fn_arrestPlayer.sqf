/*
	File: fn_arrestPlayer.sqf
	Author: Dom
	Description: Arrests the player
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit,true] call DT_fnc_checkPlayer) exitWith {};
if !(_unit getVariable ["restrained",false]) exitWith {["Person must be restrained."] call DT_fnc_notify; closeDialog 0};

private _display = findDisplay 1009;

private _minutes = ctrlText (_display displayCtrl 1402);
if !([_minutes,5] call DT_fnc_checkNumber) exitWith {};
_minutes = parseNumber _minutes;
private _name = ctrlText (_display displayCtrl 1400);
private _crimes = ctrlText (_display displayCtrl 1401);
_crimes = (_crimes splitString "&") joinString "and";
if !([_crimes] call DT_fnc_checkText) exitWith {};
private _bail = ctrlText (_display displayCtrl 1403);
if !([_bail] call DT_fnc_checkNumber) exitWith {};
_bail = parseNumber _bail;
private _notes = ctrlText (_display displayCtrl 1404);
_notes = (_notes splitString "&") joinString "and";
if !([_notes] call DT_fnc_checkText) exitWith {};

closeDialog 0;
player addItem "D_Handcuffs_i";
private _time = _minutes * 60;

private _cellInfo = call DT_fnc_assignCell;
_cellInfo params ["_cellRef","_pos","_dir"];

_unit setVariable ["jailStats",[true,_crimes,_time,_cellRef],true];
_unit forceAddUniform "U_C_WorkerCoveralls";

_unit setPosATL _pos;
_unit setDir _dir;
_unit setVariable ["restrained",false,true];

[true] remoteExecCall ["DT_fnc_jailTimer",_unit];
[_name,_crimes,profileName,_minutes,_bail,_notes] remoteExecCall ["DB_fnc_insertArrest",2];