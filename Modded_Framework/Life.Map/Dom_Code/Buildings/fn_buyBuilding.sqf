/*
	File: fn_buyBuilding.sqf
	Author: Dom
	Description: Buys a building and sends it to server to insert to DB
*/
params [
	["_building",objNull,[objNull]]
];
if (isNull _building) exitWith {};
if (_building getVariable ["owner",""] != "") exitWith {["This building is owned already.","orange"] call DT_fnc_notify};

closeDialog 0;
private _class = typeOf _building;
private _taxPercentage = (gov_taxArray select 2) / 100;
if (isClass(missionConfigFile >> "Buildings" >> "Shops" >> _class)) exitWith {
	if !(_building getVariable ["shop_owner",""] isEqualTo "") exitWith {["This building is owned already.","orange"] call DT_fnc_notify};
	private _config = missionConfigFile >> "Buildings" >> "Shops" >> typeOf _building;
	private _price = getNumber(_config >> "price");
	if (_taxPercentage != 0) then {
		_price = _price * _taxPercentage;
	};
	private _maxItems = getNumber(_config >> "maxItems");
	private _action = [
		format ["This shop is for sale for: $%1, it can support a max of %2 unique listings.",_price,_maxItems],
		"Buy property",
		"Buy",
		"Cancel"
	] call BIS_fnc_guiMessage;

	if (_action) then {
		if ((player getVariable ["bank",0]) < _price) exitWith {["You don't have enough money.","orange"] call DT_fnc_notify};
		["bank",-_price] call DT_fnc_handleMoney;

		[getPlayerUID player,_building,2,format["%1's Shop",profileName]] remoteExecCall ["DB_fnc_insertBuilding",2];
		["You bought this shop.","green"] call DT_fnc_notify;
		_building setVariable ["shop_owner",getPlayerUID player,true];
		_building setVariable ["shop_inventory",[],true];
		_building setVariable ["shop_funds",0,true];
		_building setVariable ["shop_inUse",false,true];
	};
};

if !(isClass (missionConfigFile >> "Buildings" >> "Houses" >> _class)) exitWith {["This building is not buyable.","red"] call DT_fnc_notify};
private _config = missionConfigFile >> "Buildings" >> "Houses" >> typeOf _building;
private _price = getNumber(_config >> "price");
if (_taxPercentage != 0) then {
	_price = _price * _taxPercentage;
};
private _maxFurniture = getNumber(_config >> "maxFurniture");
private _type = getNumber(_config >> "type");
private _action = [
	format ["This building is for sale for: $%1, it can support %2 furniture items.",_price,_maxFurniture],
	"Buy property",
	"Buy",
	"Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
	if ((player getVariable ["bank",0]) < _price) exitWith {["You don't have enough money.","orange"] call DT_fnc_notify};
	["bank",-_price] call DT_fnc_handleMoney;

	_building setVariable ["owner",getPlayerUID player,true];
	_building setVariable ["ownerName",profileName,true];
	_building setVariable ["locked",true,true];
	_building setVariable ["furniture",[],2];
	_building setVariable ["houseKeys",[],true];
	_building setVariable ["alarm",[false,false],true];
	[getPlayerUID player,_building,_type] remoteExecCall ["DB_fnc_insertBuilding",2];

	client_keys pushBack _building;
	["You bought this house.","green"] call DT_fnc_notify;
	private _marker = createMarkerLocal [format ["house_%1",(count client_keys)],getPosASL _building];
	_marker setMarkerTextLocal (getText(configFile >> "CfgVehicles" >> (typeOf _building) >> "displayName"));
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	for "_i" from 1 to (getNumber(configFile >> "CfgVehicles" >> typeOf _building >> "numberOfDoors")) do {
		_building setVariable [format ["bis_disabled_Door_%1",_i],1,true];
	};
};
