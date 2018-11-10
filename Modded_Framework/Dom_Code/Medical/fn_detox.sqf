/*
	File: fn_detox.sqf
	Author: Dom
	Description: Detoxifies the target
*/
params [
	["_unit",objNull,[objNull]]
];

["Initiating detox...","blue",3] call DT_fnc_notify;
uiSleep 3;
if !([_unit] call DT_fnc_checkPlayer) exitWith {};
_unit setVariable ["intoxication",0,true];
[_unit,"Detoxified"] call DT_fnc_recordMedical;
["Detoxication complete.","green"] call DT_fnc_notify;