/*
	File: fn_getVehicle.sqf
	Author: Dom
	Description: Sends request to the server to spawn a vehicle
*/
private _index = lbCurSel 1500;
if (_index isEqualTo -1) exitWith {["You need to select a vehicle.","orange"] call DT_fnc_notify};
(uiNamespace getVariable ["garage",[]]) params ["_impounded","_spawns"];

private _spawn = "";
{
	if ((nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawn = _x}
} forEach _spawns;
if (_spawn isEqualTo "") exitWith {["All spawnpoints blocked.","orange"] call DT_fnc_notify};

private _plate = lbData[1500,_index];

if (_impounded) then {
	["bank",-100] call DT_fnc_handleMoney;
	["You paid $100 to get the vehicle out the impound lot.","green"] call DT_fnc_notify;
};

[getPlayerUID player,_plate,_spawn,profileName] remoteExecCall ["DB_fnc_spawnVehicle",2];
["Requesting vehicle..."] call DT_fnc_notify;
closeDialog 0;