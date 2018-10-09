/*
    File: fn_changeAlarm.sqf
    Author: Dom
    Description: Changes settings on alarm
*/
params [
    ["_house",objNull,[objNull]]
];
if (isNull _house) exitWith {};

private _display = findDisplay -1;
private _police = _display displayCtrl -1;
private _security = _security displayCtrl -1;
private _people = [];

private _alarm = [cbChecked _police,cbChecked _security,_people];

_house setVariable ["alarm",_alarm,true];
[(_house getVariable ["id",-1]),getPlayerUID player,_alarm] remoteExecCall ["DB_fnc_updateAlarmState",2];