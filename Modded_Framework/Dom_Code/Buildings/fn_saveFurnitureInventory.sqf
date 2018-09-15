/*
    File: fn_saveFurnitureInventory.sqf
    Author: Dom
    Description: Called from containerClosed EVH to update the gear
*/
params [
    ["_container",objNull,[objNull]]
];
if (isNull _container) exitWith {};
[_container] remoteExecCall ["DB_fnc_updateFurnitureInventory",2];