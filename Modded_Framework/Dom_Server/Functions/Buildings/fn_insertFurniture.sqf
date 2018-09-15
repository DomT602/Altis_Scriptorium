/*
    File: fn_insertFurniture.sqf
    Author: Dom
    Description: Inserts selected furniture into DB
*/
params [
    ["_uid","",[""]],
    ["_furniture",objNull,[objNull]]
];

if (isNull _furniture || {_uid isEqualTo ""}) exitWith {};

private _pos = getPosATL _furniture;
private _className = typeOf _furniture;
private _dir = [vectorDir _furniture,vectorUp _furniture];

[format["insertFurniture:%1:%2:%3:%4:%5",_uid,_pos,_className,_dir],1] call MySQL_fnc_DBasync;

([format["insertedFurniture:%1:%2",_pos,_uid],2] call MySQL_fnc_DBasync) params ["_id"];
_furniture setVariable ["container_id",_id,true];