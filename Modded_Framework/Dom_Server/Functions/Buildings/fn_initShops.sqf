/*
    File: fn_initShops.sqf
    Author: Dom
    Description: Sets up shops
*/

private _shops = ["initShops",2] call MySQL_fnc_DBasync;

{
	_x params [
		["_id",0,[0]],
		["_company","",[""]],
		["_pos",[],[[]]],
		["_items",[],[[]]],
		["_funds",0,[0]]
	];
	private _building = nearestObject [_pos,"House"];
	
	_building setVariable ["id",_id,true];
	_building setVariable ["shop_company",_company,true];
    _building setVariable ["shop_inventory",_items,true];
    _building setVariable ["shop_funds",_funds,true];
    _building setVariable ["shop_inUse",false,true];
} forEach _shops;