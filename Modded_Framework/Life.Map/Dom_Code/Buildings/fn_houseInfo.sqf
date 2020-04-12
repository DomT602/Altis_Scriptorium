/*
	File: fn_houseInfo.sqf
	Author: Dom
	Description: Brings up info about the house
*/
params [
	["_house",objNull,[objNull]]
];
if (isNull _house) exitWith {};

private _owner = _house getVariable ["ownerName",""];
if (_owner isEqualTo "") exitWith {
	["This house has no registered owner.","orange"] call DT_fnc_notify;
};
[format["This house is owned by %1.",_owner]] call DT_fnc_notify;