/*
	File : fn_updateAlarmState.sqf
	Author: Dom
	Description: Syncs alarm changes to DB
*/
params [
	["_house",objNull,[objNull]],
	["_alarmState",[],[[]]]
];
if (isNull _house) exitWith {};

private _id = _house getVariable ["id",-1];
[format["updateAlarm:%1:%2",_alarmState,_id],1] call MySQL_fnc_DBasync;