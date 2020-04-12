/*
	File: fn_onInventoryClosed.sqf
	Author: Dom
	Description: Handles whenever the player closes their inventory
*/
params [
	"",
	["_container",objNull,[objNull]]
];

private _furnitureList = [];
if ((typeOf _container) in _furnitureList) then {
	[_container] remoteExecCall ["DB_fnc_updateFurniture",2];
};
_container setVariable ["inUse",nil,true];