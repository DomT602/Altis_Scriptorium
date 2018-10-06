#include "\Dom_Code\script_macros.hpp"
/*
    File: fn_buyBuilding.sqf
    Author: Dom
    Description: Buys a building and sends it to server to insert to DB
*/
params [
    ["_building",objNull,[objNull]]
];

if (isNull _building || {_building isKindOf "House_F"}) exitWith {};

if (isClass(missionConfigFile >> "Buildings" >> "Shops" >> (typeOf _building))) exitWith {
    if (player getVariable ["company","none"] isEqualTo "none") exitWith {["You are not in a company.","orange"] call DT_fnc_notify};
    if !(player getVariable ["company_rank",0] isEqualTo 3) exitWith {["Only the company owner can buy property.","orange"] call DT_fnc_notify};
    (missionConfigFile >> "Buildings" >> "Shops" >> (typeOf _building)) params ["_price","_maxItems"];
    private _action = [
        format ["This shop is for sale for: $%1, it can support a max of %2 unique items.",str(_price),str(_maxItems)],
        "Buy property",
        "Buy",
        "Cancel"
    ] call BIS_fnc_guiMessage;

    if (_action) then {
        if (BANK < _price) exitWith {hint "You don't have enough money."};
        BANK = BANK - _price;
        [0] call DT_fnc_saveStatsPartial;

        [getPlayerUID player,_building,2,(player getVariable "company")] remoteExecCall ["DT_fnc_insertBuilding",2];

        _building setVariable ["shop_company",(player getVariable "company"),true];
        _building setVariable ["shop_inventory",[],true];
        _building setVariable ["shop_funds",0,true];
        _building setVariable ["shop_inUse",false,true];
    };
};

if !(isNil {_building getVariable "owner"}) exitWith {hint "This building is owned already."};
closeDialog 0;

if !(isClass (missionConfigFile >> "Buildings" >> "Houses" >> (typeOf _building))) exitWith {hint "This building is not buyable."};
(missionConfigFile >> "Buildings" >> "Houses" >> (typeOf _building)) params ["_price","_maxFurniture","_type"];

private _action = [
    format ["This building is for sale for: $%1, it can support %2 furniture items.",str(_price),str(_maxFurniture)],
    "Buy property",
    "Buy",
    "Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
    if (BANK < _price) exitWith {hint "You don't have enough money."};
    BANK = BANK - _price;
    [0] call DT_fnc_saveStatsPartial;

    [getPlayerUID player,_building,_type] remoteExecCall ["DT_fnc_insertBuilding",2];

    _building setVariable ["owner",getPlayerUID player,true];
    _building setVariable ["locked",true,true];
    _building setVariable ["furniture",[],true];
    _building setVariable ["house_key_holders",[],true];

    client_vehicles pushBack _building;
    client_houses pushBack (getPosATL _building);
    private _marker = createMarkerLocal [format ["house_%1",round(random 99999)],getPosATL _building];
    _marker setMarkerTextLocal (getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName"));
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerTypeLocal "loc_Lighthouse";
    for "_i" from 1 to (getNumber(configFile >> "CfgVehicles" >> typeOf _house >> "numberOfDoors")) step 1 do {
        _building setVariable [format ["bis_disabled_Door_%1",_i],1,true];
    };
};
