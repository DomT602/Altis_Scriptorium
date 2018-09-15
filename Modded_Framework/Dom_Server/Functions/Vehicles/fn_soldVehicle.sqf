/*
    File: fn_soldVehicle.sqf
    Author: Dom
    Description: Sells a vehicle and deletes it from DB
*/
params [
    ["_plate","",[""]],
    ["_pid","",[""]]
];

if (_plate isEqualTo "" || {_pid isEqualTo ""}) exitWith {};

[format["deleteVehicle:%1:%2",_pid,_plate],1] call MySQL_fnc_DBasync;