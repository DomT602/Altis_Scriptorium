/*
    File : fn_updateShop.sqf
    Author: Dom
    Description: Syncs shop changes to DB
*/
params [
    ["_shop",objNull,[objNull]]
];

private _id = _shop getVariable ["id",-1];
private _items = _shop getVariable ["shop_inventory",[]];
private _funds = _shop getVariable ["shop_funds",0];

[format["updateShop:%1:%2:%3",_items,_funds,_id],1] call MySQL_fnc_DBasync;