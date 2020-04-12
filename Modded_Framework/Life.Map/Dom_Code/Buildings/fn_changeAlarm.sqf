/*
	File: fn_changeAlarm.sqf
	Author: Dom
	Description: Changes settings on alarm
*/
params [
	["_house",objNull,[objNull]]
];
if (isNull _house) exitWith {};

private _display = findDisplay 1029;
private _police = _display displayCtrl 2800;
private _security = _display displayCtrl 2801;
closeDialog 0;

private _alarm = [cbChecked _police,cbChecked _security];

_house setVariable ["alarm",_alarm,true];
[_house,_alarm] remoteExecCall ["DB_fnc_updateAlarmState",2];
["Alarm updated.","green"] call DT_fnc_notify;