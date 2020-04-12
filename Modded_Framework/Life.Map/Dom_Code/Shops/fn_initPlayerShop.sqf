/*
	File: fn_initPlayerShop.sqf
	Author: Dom
	Description: Initiliases player item shops
*/
params [
	["_shop",objNull,[objNull]]
];

if (_shop getVariable ["shop_inUse",false]) exitWith {["Someone else is using this shop."] call DT_fnc_notify};
_shop setVariable ["shop_inUse",true,true];
private _items = _shop getVariable ["shop_inventory",[]];

if !(createDialog "DT_playerShop") exitWith {};

private _display = findDisplay 1042;
(_display displayCtrl 1101) ctrlSetStructuredText parseText (_shop getVariable ["shop_name",""]);
private _listbox = _display displayCtrl 1500;

{
	_x params ["_className","_price","_quantity"];
	([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
	_listbox lbAdd format["[%1] %2",_quantity,_name];
	_listbox lbSetData [_forEachIndex,str(_x)];
	_listbox lbSetPicture [_forEachIndex,_picture];
} forEach _items;