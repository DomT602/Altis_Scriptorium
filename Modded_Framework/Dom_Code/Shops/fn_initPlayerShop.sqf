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

disableSerialization;

ctrlSetText[-1,_company];

private _primaryList = ((findDisplay -1) displayCtrl -1);
lbClear _primaryList;

{
	_x params ["_className","_price"];
	([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
	_primaryList lbAdd format ["%1",_name];
	_primaryList lbSetData[(lbSize _primaryList)-1,_className];
	_primaryList lbSetPicture[(lbSize _primaryList)-1,_picture];
	_primaryList lbSetValue[(lbSize _primaryList)-1,_price];
} forEach _items;