/*
	File: fn_transferVehicle.sqf
	Author: Dom
	Description: Transfers ownership of a vehicle
*/
params [
	["_plate","",[""]],
	["_uid","",[""]]
];
if (_plate isEqualTo "" || {_uid isEqualTo ""}) exitWith {};

[format["transferVehicle:%1:%2",_uid,_plate],1] call MySQL_fnc_DBasync;