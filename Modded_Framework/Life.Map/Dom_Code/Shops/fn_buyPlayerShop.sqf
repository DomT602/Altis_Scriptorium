/*
	File: fn_buyPlayerShop.sqf
	Author: Dom
	Description: Handles buying from a player owned shop
*/
private _display = findDisplay 1042;
private _listbox = _display displayCtrl 1500;
private _index = lbCurSel _listbox;
if (_index isEqualTo -1) exitWith {["Nothing selected.","orange"] call DT_fnc_notify};
(parseSimpleArray (_listbox lbData _index)) params ["_item","_price","_quantity"];
([_item] call DT_fnc_fetchDetails) params ["_name"];
if !(player canAdd [_item,_quantity]) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify};
if (_price > (player getVariable ["cash",0])) exitWith {["You don't have enough money.","orange"] call DT_fnc_notify};

(_display displayCtrl 1102) ctrlSetStructuredText parseText "";
_listbox lbDelete _index;
private _items = MB_Interaction_Target getVariable ["shop_inventory",[]];
_items deleteAt _index;
MB_Interaction_Target setVariable ["shop_inventory",_items,true];
private _funds = MB_Interaction_Target getVariable ["shop_funds",0];
MB_Interaction_Target setVariable ["shop_funds",(_funds + _price),true];

["cash",-_price] call DT_fnc_handleMoney;
for "_i" from 1 to _quantity do {
	player addItem _item;
};

[format["You bought %1x %2 for $%3.",_quantity,_name,_price],"green"] call DT_fnc_notify;
[MB_Interaction_Target] remoteExecCall ["DB_fnc_updateShop",2];