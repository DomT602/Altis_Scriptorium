/*
    File: fn_getVehicle.sqf
    Author: Dom
    Description: Sends request to the server to spawn a vehicle
*/
private _index = lbCurSel 1500;
if (_index isEqualTo -1) exitWith {["You need to select a vehicle.","orange"] call DT_fnc_notify};

private _spawn = "";
{
    if ((nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawn = _x}
} forEach (uiNamespace getVariable ["Garage_Spawns",[]]);
if (_spawn isEqualTo "") exitWith {["All spawnpoints blocked.","orange"] call DT_fnc_notify};

private _id = lbValue[1500,_index];

if (uiNamespace getVariable ["Impound_Lot",false]) then {
	client_bank = (client_bank - 100) max 0;
	["You paid $100 to get the vehicle out the impound lot.","green"] call DT_fnc_notify;
};

[getPlayerUID player,_id,_spawn,name player] remoteExecCall ["DB_fnc_spawnVehicle",2];
["Requesting vehicle..."] call DT_fnc_notify;
closeDialog 0;