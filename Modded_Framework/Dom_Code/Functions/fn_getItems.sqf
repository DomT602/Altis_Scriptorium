/*
	File: fn_getItems.sqf
	Author: Dom
	Description: Returns an array of the players items
*/
params [
	["_unit",player,[objNull]]
];

private _items = [];
_items append (uniformItems _unit);
_items append (vestItems _unit);
_items append (backpackItems _unit);
_items;