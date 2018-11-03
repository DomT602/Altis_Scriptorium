/*
    File: fn_buyPlayerShop.sqf
    Author: Dom
    Description: Handles buying from a player owned shop
*/
private _selected = lbCurSel -1;
if (_selected isEqualTo -1) exitWith {["Nothing selected.","orange"] call DT_fnc_notify;};
private _price = lbValue[-1,_selected];
private _item = lbData[-1,_selected];
([_item] call DT_fnc_fetchDetails) params ["_name"];
if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange"] call DT_fnc_notify};
if (_price > client_cash) exitWith {["You don't have enough money.","orange"] call DT_fnc_notify};

lbDelete [-1,_selected];
_items deleteAt _selected;

private _items = MB_Interaction_Target getVariable ["shop_inventory",[]];
MB_Interaction_Target setVariable ["shop_inventory",_items,true];
private _funds = MB_Interaction_Target getVariable ["shop_funds",0];
MB_Interaction_Target setVariable ["shop_funds",(_funds + _price),true];

client_cash = client_cash - _price;
player addItem _item;
[format["You bought a %1 for $%2.",_name,str(_price)],"green"] call DT_fnc_notify;
[0] call DT_fnc_saveStatsPartial;
[2] call DT_fnc_saveStatsPartial;