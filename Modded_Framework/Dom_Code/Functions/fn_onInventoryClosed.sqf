/*
	File: fn_onInventoryClosed.sqf
	Author: Dom
	Description: Handles whenever the player closes their inventory
*/

params [
	"",
	["_container",objNull,[objNull]]
];

_container setVariable ["inUse",nil,true];

[2] call DT_fnc_saveStatsPartial;