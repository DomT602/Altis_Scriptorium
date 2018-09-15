#include "\Dom_Code\script_macros.hpp"
/*
    File: fn_vehicleShopBuy.sqf
    Author: Dom
    Description: Buys a vehicle and sends info to server to input to DB
*/

if ((lbCurSel 1500) isEqualTo -1) exitWith {["No vehicle selected.","orange"] call DT_fnc_notify; closeDialog 0};
(uiNamespace getVariable ["Veh_Shop_Details",[]]) params ["_shop","_spawnPoints"];
private _className = lbData[1500,(lbCurSel 1500)];
private _price = lbValue[1500,(lbCurSel 1500)];
private _colourIndex = lbValue[2100,(lbCurSel 2100)];

closeDialog 0;
if (CASH < _price) exitWith {[format["You don't have enough money, $%1 needed.",str(_price - CASH)],"orange"] call DT_fnc_notify; closeDialog 0};

private _spawnPoint = "";
{
    if ((nearestObjects[getMarkerPos _x,["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _x}
} forEach _spawnPoints;

if (_spawnPoint isEqualTo "") exitWith {["Another vehicle is blocking the spawn point.","red"] call DT_fnc_notify; closeDialog 0};
CASH = CASH - _price;
[0] call DT_fnc_saveStatsPartial;
[format["You bought %1 for $%2.",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),str(_price)],"green"] call DT_fnc_notify;

private _vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
[
	{
		!isNull (_this select 0)
	},
	{
		params [
			["_vehicle",objNull,[objNull]],
			["_spawnPoint","",[""]],
			["_colourIndex",-1,[0]]
		];
		_vehicle allowDamage false;
		_vehicle setPos (getMarkerPos _spawnPoint);
		_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
		_vehicle setDir (markerDir _spawnPoint);

		_vehicle lock 2;

		[_vehicle,_colourIndex] call DT_fnc_setTexture;
		clearWeaponCargoGlobal _vehicle;
		clearMagazineCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;
		_vehicle setVariable ["key_holders",[profileName],true];

		_vehicle allowDamage true;

		client_keys pushBack _vehicle;
		[getPlayerUID player,_vehicle,1] remoteExecCall ["server_fnc_handleKeys",2];
		[getPlayerUID player,_vehicle,player getVariable ["faction","civ"],_colourIndex] remoteExecCall ["DB_fnc_insertVehicle",2];
	},
	[_vehicle,_spawnPoint,_colourIndex]
] call CBA_fnc_waitUntilAndExecute;