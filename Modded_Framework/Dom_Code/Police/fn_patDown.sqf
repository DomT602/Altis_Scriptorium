/*
	File: fn_patDown.sqf
	Author: Dom
	Description: Pats down a player for weapons, magazines, drugs etc
*/

nearestObjects [player,["GroundWeaponHolder"],3] params [["_holder",objNull,[objNull]]];
if (isNull _holder) then {
	_holder = createVehicle ["GroundWeaponHolder",getPosATL player,[],0,"CAN_COLLIDE"];
};

private _weapons = [];
{
	player removeWeapon _x;
	_weapons pushBack _x;
} forEach weapons player;

private _magazines = [];
{
	player removeMagazine _x;
	_magazines pushBack _x;
} forEach magazines player;

{
	_holder addWeaponCargoGlobal [_x,1];
} forEach _weapons;

{
	_holder addMagazineCargoGlobal [_x,1];
} forEach _magazines;

[2] call DT_fnc_saveStatsPartial;