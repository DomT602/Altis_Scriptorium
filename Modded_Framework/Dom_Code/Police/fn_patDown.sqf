/*
	File: fn_patDown.sqf
	Author: Dom
	Description: Pats down a player for weapons, magazines, drugs etc
*/

nearestObjects [player,["GroundWeaponHolder"],3] params [["_holder",objNull,[objNull]]];
if (isNull _holder) then {
	_holder = createVehicle ["GroundWeaponHolder",getPosATL player,[],0,"CAN_COLLIDE"];
};

{
	player removeWeapon _x;
	_holder addWeaponCargoGlobal [_x,1];
} forEach weapons player;

{
	player removeMagazine _x;
	_holder addMagazineCargoGlobal [_x,1];
} forEach magazines player;

[2] call DT_fnc_saveStatsPartial;