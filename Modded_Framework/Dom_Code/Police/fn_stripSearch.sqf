/*
	File: fn_stripSearch.sqf
	Author: Dom
	Description: Strips a player for all items
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

private _items = [];
{
	player unassignItem _x;
	player removeItem _x;
	_items pushBack _x;
} forEach assignedItems player;

{
	player removeItem _x;
	_items pushBack _x;
} forEach items player;

{
	_holder addWeaponCargoGlobal [_x,1];
} forEach _weapons;

{
	_holder addMagazineCargoGlobal [_x,1];
} forEach _magazines;

{
	_holder addItemCargoGlobal [_x,1];
} forEach _items;

[2] call DT_fnc_saveStatsPartial;