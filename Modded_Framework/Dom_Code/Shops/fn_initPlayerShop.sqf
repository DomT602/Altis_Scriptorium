/*
	File: fn_initPlayerShop.sqf
	Author: Dom
	Description: Initiliases player item shops
	onUnload = "MB_Interaction_Target setVariable ['shop_inUse',false,true]; [MB_Interaction_Target] remoteExecCall ['DB_fnc_updateShop',2]";
*/
params [
	["_shop",objNull,[objNull]]
];

if (_shop getVariable ["shop_inUse",false]) exitWith {["Someone else is using this shop."] call DT_fnc_notify};
_shop setVariable ["shop_inUse",true,true];
private _company = _shop getVariable ["shop_company",""];
private _items = _shop getVariable ["shop_inventory",[]];

if !(createDialog "Player_Shop") exitWith {};

ctrlSetText[-1,_company];

private _primaryList = ((findDisplay -1) displayCtrl -1);
lbClear _primaryList;

{
	private _index = _forEachIndex;
	_x params ["_className","_price"];
	([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
	_primaryList lbAdd _name;
	_primaryList lbSetData[_index,_className];
	_primaryList lbSetPicture[_index,_picture];
	_primaryList lbSetValue[_index,_price];
} forEach _items;