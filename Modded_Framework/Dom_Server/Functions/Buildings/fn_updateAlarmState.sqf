/*
    File : fn_updateAlarmState.sqf
    Author: Dom
    Description: Syncs alarm changes to DB
*/
params [
    ["_id",-1,[0]],
    ["_pid","",[""]],
    ["_alarmState",[],[[]]] //alert cops, alert security, uid's
];
if (_id isEqualTo -1) exitWith {};

[format["updateAlarm:%1:%2",_alarmState,_id,_pid],1] call MySQL_fnc_DBasync;