/*
	File: fn_giveTicket.sqf
	Author: Dom
	Description: Gives the targeted player a ticket
*/
params [
	["_target",objNull,[objNull]]
];

if (_target isKindOf "Car") then {
	_target = driver _target;
};

private _value = ctrlText -1;
if !([_value,0] call DT_fnc_checkNumber) exitWith {};
_value = parseNumber _value;
private _reason = ctrlText -1;

if (_reason isEqualTo "") exitWith {["Invalid reason.","orange"] call DT_fnc_notify};

[player,_value,_reason] remoteExecCall ["DT_fnc_recieveTicket",_target];