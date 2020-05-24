/*
	File: fn_patDown.sqf
	Author: Dom
	Description: Pats down a player for weapons, magazines, drugs etc
*/
params [
	["_strip",false,[false]]
];

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

if (_strip) then {
	{
		player unassignItem _x;
		player removeItem _x;
		_holder addItemCargoGlobal [_x,1];
	} forEach assignedItems player;

	{
		player removeItem _x;
		_holder addItemCargoGlobal [_x,1];
	} forEach items player;
};

if (client_goPro) then {
	client_goPro = false;
	["goPro"] call DT_fnc_updateHUDPartial;
};