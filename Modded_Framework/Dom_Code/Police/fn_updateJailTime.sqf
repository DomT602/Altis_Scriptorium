/*
    File: fn_updateJailTime.sqf
    Author: Dom
    Description: Adjusts players jail time
*/
params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit || {!isPlayer _unit}) exitWith {};

private _display = findDisplay 1009;
private _hours = parseNumber (ctrlText (_display displayCtrl 1400));
private _minutes = parseNumber (ctrlText (_display displayCtrl 1401));
private _seconds = parseNumber (ctrlText (_display displayCtrl 1402));
private _crimes = ctrlText (_display displayCtrl 1403);
closeDialog 0;

private _time = _seconds + (_minutes * 60) + (_hours * 3600);

_unit setVariable ["jail_details",[1,_crimes,_time,""],true];

remoteExecCall ["DT_fnc_jailTimeChanged",_unit];
