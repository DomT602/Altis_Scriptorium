/*
	File: fn_switchLegCuff.sqf
	Author: Dom
	Description: Either puts on or takes off leg cuffs
*/

if (isForcedWalk player) then {
	["Your legs are no longer cuffed.","green"] call DT_fnc_notify;
	player forceWalk false;
} else {
	["Your legs have been cuffed.","orange"] call DT_fnc_notify;
	player forceWalk true;
};