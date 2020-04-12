/*
	File: fn_giveTicket.sqf
	Author: Dom
	Description: Gives the targeted player a ticket
*/
params [
	["_target",objNull,[objNull]],
	["_bail",false,[true]]
];

if (_target isKindOf "Car") then {
	_target = driver _target;
};

private _name = ctrlText 1400;
private _reason = ctrlText 1401;
if (_reason isEqualTo "") exitWith {["Invalid reason.","orange"] call DT_fnc_notify};
_reason = (_reason splitString "&") joinString "and";
if !([_reason] call DT_fnc_checkText) exitWith {};
private _value = ctrlText 1402;
if !([_value,0] call DT_fnc_checkNumber) exitWith {};
_value = parseNumber _value;
private _officer = ctrlText 1403;

closeDialog 0;
["Ticket issued.","green"] call DT_fnc_notify;
[_bail,_name,_reason,_value,_officer] remoteExecCall ["DT_fnc_recieveTicket",_target];