/*
    File: fn_storeVehicle.sqf
    Author: Dom
    Description: Checks for a players vehicle and stores it
*/
params [
    ["_garage",objNull,[objNull]]
];

if (isNull _garage) exitWith {};

private _nearVehicles = nearestObjects[getPosATL _garage,["Car","Air","Ship"],10];
private _vehicle = objNull;

if !(_nearVehicles isEqualTo []) then {
    {
        (_x getVariable ["key_holders",[]]) params [["_owner","",[""]]];
        if !(_owner isEqualTo "") then {
            if (profileName isEqualTo _owner && {_x in client_keys}) exitWith {
                _vehicle = _x;
            };
        };
        if !(isNull _vehicle) exitWith {};
    } forEach _nearVehicles;
};

if (isNull _vehicle) exitWith {["You do not have a vehicle nearby.","red",5] call DT_fnc_notify};
if !(alive _vehicle) exitWith {["You can't store a destroyed vehicle.","red"] call DT_fnc_notify};

[_vehicle,false] remoteExecCall ["DB_fnc_storeVehicle",2];

["Storing vehicle..."] call DT_fnc_notify;