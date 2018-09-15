/*
    File: fn_switchLegCuff.sqf
    Author: Dom
    Description: Either puts on or takes off leg cuffs
*/
params [
	["_unit",objNull,[objNull]]
];

if (isForcedWalk player) then {
	player forceWalk false;
} else {
	player forceWalk true;
};