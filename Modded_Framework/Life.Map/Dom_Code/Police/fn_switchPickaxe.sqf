/*
	File: fn_switchPickaxe.sqf
	Author: Dom
	Description: Either takes away or gives a person a pickaxe
*/
params [
	["_unit",objNull,[objNull]]
];

if (currentWeapon _unit isEqualTo "Pickaxe") then {
	_unit removeWeaponGlobal "Pickaxe";
} else {
	_unit addWeaponGlobal "Pickaxe";
	_unit addMagazine ["blah",999];
};