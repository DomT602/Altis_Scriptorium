/*
	File: fn_countFaction.sqf
	Author: Dom
	Description: Counts players of a certain faction online, e.g _cops = ["cop",true] call DT_fnc_countFaction;
*/
params [
	["_side","cop",[""]],
	["_dead",false,[false]]
];

if (_dead) then {
	{!(_x isEqualTo player) && {(_x getVariable ["faction","civ"]) isEqualTo _side} && {!(_x getVariable ["dead",false])}} count playableUnits;
} else {
	{(_x getVariable ["faction","civ"]) isEqualTo _side} count playableUnits;
};