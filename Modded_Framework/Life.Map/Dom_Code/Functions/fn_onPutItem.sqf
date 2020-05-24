/*
	File: fn_onPutItem.sqf
	Author: Dom
	Description: Handles when an item is placed
*/
params [
	"",
	"",
	["_item","",[""]]
];

if (client_goPro && {!("D_GoPro_i" in (magazines player))}) then {
	client_goPro = false;
	["goPro"] call DT_fnc_updateHUDPartial;
};