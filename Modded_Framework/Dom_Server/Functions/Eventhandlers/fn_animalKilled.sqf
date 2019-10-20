/*
	File: fn_animalKilled.sqf
	Author: Dom
	Description: Handles when an animal is killed (for meat quality)
*/

params [
	["_animal",objNull,[objNull]],
	"",
	["_source",objNull,[objNull]]
];

if (isNull objectParent _source) then {
	_animal setVariable ["quality",true,true];
};