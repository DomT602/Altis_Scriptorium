/*
    File: fn_switchSirens.sqf
    Author: Dom
    Description: Checks if vehicle supports sirens and tells server to start them if needed
*/

params [
    ["_type",0,[0]]
];

private _vehicle = objectParent player;
if (isNull _vehicle) exitWith {};
//if !(typeOf _vehicle in siren_vehicles) exitWith {["This vehicle does not support sirens.","orange"] call DT_fnc_notify};

if (_vehicle getVariable ["siren",false]) then {
    _vehicle setVariable ["siren",false,true];
} else {
    _vehicle setVariable ["siren",true,true];
    [_vehicle,_type] remoteExec ["server_fnc_startSirens",2];
};