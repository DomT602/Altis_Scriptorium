/*
    File: fn_switchPickaxe.sqf
    Author: Dom
    Description: Either takes away or gives a person a pickaxe
*/
params [
	["_unit",objNull,[objNull]]
];

if (currentWeapon player isEqualTo "Pickaxe") then {
	player removeWeapon "Pickaxe";
} else {
	player addWeapon "Pickaxe";
};