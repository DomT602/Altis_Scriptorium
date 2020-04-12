/*
	File: fn_updateShop.sqf
	Author: Dom
	Description: Syncs shop changes to DB
*/
params [
	["_shop",objNull,[objNull]],
	["_type",0,[0]]
];

private _id = _shop getVariable ["id",-1];
private _items = _shop getVariable ["shop_inventory",[]];
private _funds = _shop getVariable ["shop_funds",0];
switch _type do {
	case 0: {
		[format["updateShop:%1:%2:%3",_items,_funds,_id],1] call MySQL_fnc_DBasync;
	};
	case 1: {
		[format["updateShopInventory:%1:%2",_items,_id],1] call MySQL_fnc_DBasync;
	};
	case 2: {
		[format["updateShopFunds:%1:%2",_funds,_id],1] call MySQL_fnc_DBasync;
	};
	case 3: {
		private _name = _shop getVariable ["shop_name",""];
		[format["updateShopName:%1:%2",_name,_id],1] call MySQL_fnc_DBasync;
		(format["shop%1",_id]) setMarkerText _name;
	};
};