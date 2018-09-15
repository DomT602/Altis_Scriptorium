/*
    File: fn_removeFurniture.sqf
    Author: Dom
    Description: Delete selected furniture from DB
*/
params [
    ["_uid","",[""]],
    ["_furniture",objNull,[objNull]]
];

if (isNull _furniture || {_uid isEqualTo ""}) exitWith {};

private _id = _furniture getVariable ["container_id",-1];
if (_id isEqualTo -1) exitWith {};

[format["deleteFurniture:%1:%2",_uid,_id],1] call MySQL_fnc_DBasync;

_furniture setVariable ["furniture_owner",nil,true];
_furniture setVariable ["furniture_id",nil,true];
deleteVehicle _furniture;