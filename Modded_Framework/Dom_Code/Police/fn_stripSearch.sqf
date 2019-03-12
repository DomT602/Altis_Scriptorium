/*
	File: fn_stripSearch.sqf
	Author: Dom
	Description: Strips a player for all items
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

{
	player unassignItem _x;
	player removeItem _x;
	_holder addItemCargoGlobal [_x,1];
} forEach assignedItems player;

{
	player removeItem _x;
	_holder addItemCargoGlobal [_x,1];
} forEach items player;

[2] call DT_fnc_saveStatsPartial;