/*
	File: fn_initBuildings.sqf
	Author: Dom
	Description: Sets up buildings
*/

private _houses = ["initHouses",2,true] call MySQL_fnc_DBasync;
{
	_x params [
		["_id",0,[0]],
		["_owner","",[""]],
		["_pos",[],[[]]],
		["_alarm",[],[[]]],
		["_shared",[],[[]]],
		["_name","",[""]]
	];
	private _house = nearestObject [_pos,"House"];
	
	_house setVariable ["id",_id,false];
	_house setVariable ["owner",_owner,true];
	_house setVariable ["ownerName",_name,true];
	_house setVariable ["locked",true,true];
	_house setVariable ["houseKeys",_shared,true];
	_house setVariable ["alarm",_alarm,true];
	
	for "_i" from 1 to (getNumber(configFile >> "CfgVehicles" >> typeOf _house >> "numberOfDoors")) do {
		_house setVariable [format["bis_disabled_Door_%1",_i],1,true];
	};
} forEach _houses;

private _shops = ["initShops",2,true] call MySQL_fnc_DBasync;
{
	_x params [
		["_id",0,[0]],
		["_owner","",[""]],
		["_pos",[],[[]]],
		["_items",[],[[]]],
		["_funds",0,[0]],
		["_shopName","",[""]]
	];
	private _building = nearestObject [_pos,"Building"];
	_building setVariable ["id",_id,false];
	_building setVariable ["shop_owner",_owner,true];
	_building setVariable ["shop_name",_shopName,true];
	_building setVariable ["shop_inventory",_items,true];
	_building setVariable ["shop_funds",_funds,true];
	_building setVariable ["shop_inUse",false,true];
	private _mark = createMarker [format["shop%1",_id],_building];
	_mark setMarkerText _shopName;
	_mark setMarkerType "Mil_dot";
	_mark setMarkerColor "ColorBlack";
} forEach _shops;