/*
	File: fn_onInventoryClosed.sqf
	Author: Dom
	Description: Handles whenever the player closes their inventory
*/

params [
	["_unit",objNull,[objNull]],
	["_container",objNull,[objNull]]
];

if (isNull _container) exitWith {false};
_container setVariable ["inUse",nil,true];

private _furnitureList = [];
if ((typeOf _container) in _furnitureList) then {
	[_container] remoteExecCall ["DB_fnc_updateFurnitureInventory",2];
};
[2] call DT_fnc_saveStatsPartial;