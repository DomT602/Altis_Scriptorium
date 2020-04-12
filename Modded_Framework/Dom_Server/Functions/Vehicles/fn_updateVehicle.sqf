/*
	File: fn_updateVehicle.sqf
	Author: Dom
	Description: Updates the customisation of a vehicle
*/
params [
	["_vehicle",objNull,[objNull]]
];
if (isNull _vehicle) exitWith {};

private _plate = _vehicle getVariable ["plate",""];
private _customisation = _vehicle getVariable ["customisation",[0]];
[format["updateVehicle:%1:%2",_customisation,_plate],1] call MySQL_fnc_DBasync;