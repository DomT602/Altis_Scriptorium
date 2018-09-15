/*
    File : fn_updateFurnitureInventory.sqf
    Author: Dom
    Description: Syncs furniture to DB
*/
params [
    ["_furniture",objNull,[objNull]]
];
if (isNull _furniture) exitWith {};

(_furniture getVariable ["container_id",-1]) params ["_id"];
if (_id isEqualTo -1) exitWith {};

private _gear = [getItemCargo _furniture,getMagazineCargo _furniture,getWeaponCargo _furniture,getBackpackCargo _furniture];

[format["updateFurnitureGear:%1:%2",_gear,_id],1] call MySQL_fnc_DBasync;