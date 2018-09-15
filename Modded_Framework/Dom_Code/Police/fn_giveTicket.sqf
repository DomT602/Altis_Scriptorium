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

private _value = parseNumber(ctrlText -1);
private _reason = ctrlText -1;

if !(_value > 0) exitWith {["Invalid value.","orange"] call DT_fnc_notify};
if (_reason isEqualTo "") exitWith {["Invalid reason.","orange"] call DT_fnc_notify};

[player,_value,_reason] remoteExecCall ["DT_fnc_recieveTicket",_target];