/*
    File: fn_findIndex.sqf
    Author: Dom
    Description: Finds where the index of selected item in selected array, then returns the index - made much easier by findIf in 1.82
*/
params [
	["_item","",[""]],
	["_array",[],[[]]]
];

_array findIf {_item == (_x select 0)};