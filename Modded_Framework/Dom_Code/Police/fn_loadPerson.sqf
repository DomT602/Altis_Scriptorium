/*
    File: fn_loadPerson.sqf
    Author: Dom
    Description: Loads person into a vehicle
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit,true] call DT_fnc_checkPlayer) exitWith {};
nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10,false] params [["_vehicle",objNull,[objNull]]];
if (isNull _vehicle) exitWith {["There is no suitable vehicle nearby.","orange"] call DT_fnc_notify};

detach _unit;
[_vehicle] remoteExecCall ["DT_fnc_beLoaded",_unit];