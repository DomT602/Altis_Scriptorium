/*
    File: fn_initShops.sqf
    Author: Dom
    Description: Sets up shops
*/

private _shops = ["initShops",2] call MySQL_fnc_DBasync;

{
	_x params [
		"_company",
		"_pos",
		"_items"
	];
	private _pos = parseSimpleArray format ["%1",_pos];
	private _building = nearestObject [_pos,"House"];
	
	_building setVariable ["shop_company",_company,true];
    _building setVariable ["shop_inventory",_items,true];
    _building setVariable ["shop_funds",0,true];
    _building setVariable ["shop_inUse",false,true];
} forEach _shops;