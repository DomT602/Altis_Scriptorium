/*
	File: fn_loadPerson.sqf
	Author: Dom
	Description: Loads person into a vehicle
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit,true] call DT_fnc_checkPlayer) exitWith {};
private _vehicles = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10,false];
private _index = _vehicles findIf {_x in client_keys};
if (_index isEqualTo -1) exitWith {["There is no suitable vehicle nearby.","orange"] call DT_fnc_notify};
private _vehicle = _vehicles select _index;

detach _unit;
[_vehicle] remoteExecCall ["DT_fnc_beLoaded",_unit];