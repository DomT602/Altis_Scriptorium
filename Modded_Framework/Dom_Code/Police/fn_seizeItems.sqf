/*
	File: fn_seizeItems.sqf
	Author: Dom
	Description: Deletes the groundweaponholder and tells player what they seized (for evidence etc)
*/

params [
	["_holder",objNull,[objNull]]
];

private _nameArray = [];
private _countArray = [];
(getWeaponCargo _holder) params ["_wepNames","_wepCount"];
(getMagazineCargo _holder) params ["_magNames","_magCount"];
(getItemCargo _holder) params ["_itemNames","_itemCount"];
(getBackpackCargo _holder) params ["_packNames","_packCount"];

_nameArray append _wepNames;
_nameArray append _magNames;
_nameArray append _itemNames;
_nameArray append _packNames;

_countArray append _wepCount;
_countArray append _magCount;
_countArray append _itemCount;
_countArray append _packCount;

deleteVehicle _holder;
private _string = "Items seized: ";
{
	([_x] call DT_fnc_fetchDetails) params ["_name"];
	_string = _string + str(_countArray select _forEachIndex) + "x " + _name + ", ";
} forEach _nameArray;
hint _string;