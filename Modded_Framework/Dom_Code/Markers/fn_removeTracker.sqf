/*
	File: fn_removeTracker.sqf
	Author: Dom
	Description: Allows you to remove a GPS tracker from you/a vehicle, not sure if I want this on a NPC, or use an item, your choice
*/
params [
	["_thing",objNull,[objNull]]
];
if (isNull _thing) exitWith {};

if (_thing getVariable ["tracked",false]) then {
	_thing setVariable ["tracked",nil,false];
};