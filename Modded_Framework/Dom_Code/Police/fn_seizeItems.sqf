/*
	File: fn_seizeItems.sqf
	Author: Dom
	Description: Deletes the groundweaponholder and tells player what they seized (for evidence etc)
*/
params [
	["_holder",objNull,[objNull]]
];

(getWeaponCargo _holder) params ["_wepNames","_wepCount"];
(getMagazineCargo _holder) params ["_magNames","_magCount"];
(getItemCargo _holder) params ["_itemNames","_itemCount"];
(getBackpackCargo _holder) params ["_packNames","_packCount"];

private _nameArray = _wepNames;
_nameArray append _magNames;
_nameArray append _itemNames;
_nameArray append _packNames;

private _countArray = _wepCount;
_countArray append _magCount;
_countArray append _itemCount;
_countArray append _packCount;

deleteVehicle _holder;
private _string = "Items seized: ";
{
	([_x] call DT_fnc_fetchDetails) params ["_name"];
	_string = format["%1%2x %3, ",_string,str(_countArray select _forEachIndex),_name];
} forEach _nameArray;
hint _string;