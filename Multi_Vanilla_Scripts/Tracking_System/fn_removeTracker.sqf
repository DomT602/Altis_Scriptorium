/*
	File: fn_removeTracker.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Allows you to remove a GPS tracker from you/a vehicle, not sure if I want this on a NPC, or use an item, your choice
	Removing player tracking e.g [player] remoteExecCall ["life_fnc_removeTracker",-2]; 
*/

params [
	["_thing",objNull,[objNull]]
];
if (isNull _thing) exitWith {};

if (_thing getVariable ["tracked",false]) then {
	_thing setVariable ["tracked",nil,false];
};