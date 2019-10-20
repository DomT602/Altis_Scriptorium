/*
	File: fn_flipVehicle.sqf
	Author: Dom
	Description: Flips a vehicle
*/
params [
	["_vehicle",objNull,[objNull]]
];

if !([_vehicle,5] call DT_fnc_checkVehicle) exitWith {};

_vehicle setPosATL ((getPosATL _vehicle) vectorAdd [0,0,3]);
_vehicle setVectorUp (surfaceNormal getPosATL _vehicle);