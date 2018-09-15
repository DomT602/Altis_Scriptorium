/*
	File: fn_animalHandleDamage.sqf
	Author: Dom
	Description: Handles damage to an animal (for meat quality)
*/

params [
	["_animal",objNull,[objNull]],
	"",
	"",
	["_source",objNull,[objNull]]
];

if (isNull objectParent _source) then {
	_animal setVariable ["quality",true,true];
};