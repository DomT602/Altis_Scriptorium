/*
	File: fn_stripSearch.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Strips a player for all items and puts them on the floor
	To-do: Place file where you want (default core/cop), add to functions.hpp
    Add a new button to fn_copInteractionMenu.sqf with below code:
	    _Btn9 ctrlSetText "Strip Search";
		_Btn9 buttonSetAction "remoteExecCall ['life_fnc_stripSearch',life_pInact_curTarget]; closeDialog 0;";
    Add this to CfgRemoteExec
    F(life_fnc_stripSearch,CLIENT)
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

[2] call SOCK_fnc_updatePartial;