/*
	File: fn_soldVehicle.sqf
	Author: Dom
	Description: Sells a vehicle and deletes it from DB
*/
params [
	["_plate","",[""]]
];
if (_plate isEqualTo "") exitWith {};

[format["deleteVehicle:%1",_plate],1] call MySQL_fnc_DBasync;