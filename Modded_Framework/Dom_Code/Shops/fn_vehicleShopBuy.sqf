/*
    File: fn_vehicleShopBuy.sqf
    Author: Dom
    Description: Buys a vehicle and sends info to server to input to DB
*/
private _index = lbCurSel 1500;
if (_index isEqualTo -1) exitWith {["No vehicle selected.","orange"] call DT_fnc_notify; closeDialog 0};
(uiNamespace getVariable ["Veh_Shop_Details",[]]) params ["_shop","_spawnPoints"];
private _className = lbData[1500,_index];
private _price = lbValue[1500,_index];
private _colourIndex = lbValue[2100,_index];

closeDialog 0;
if (client_cash < _price) exitWith {[format["You don't have enough money, $%1 needed.",str(_price - client_cash)],"orange"] call DT_fnc_notify; closeDialog 0};

private _spawnPoint = "";
{
    if ((nearestObjects[getMarkerPos _x,["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _x}
} forEach _spawnPoints;

if (_spawnPoint isEqualTo "") exitWith {["Another vehicle is blocking the spawn point.","red"] call DT_fnc_notify; closeDialog 0};
client_cash = client_cash - _price;
[0] call DT_fnc_saveStatsPartial;
[format["You bought %1 for $%2.",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),str(_price)],"green"] call DT_fnc_notify;

[_className,_spawnPoint,getPlayerUID player,player getVariable ["faction","civ"],_colourIndex] remoteExecCall ["DB_fnc_insertVehicle",2];