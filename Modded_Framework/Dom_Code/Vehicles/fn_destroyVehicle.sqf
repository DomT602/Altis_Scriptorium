/*
    File: fn_getVehicle.sqf
    Author: Dom
    Description: Sends request to the server to spawn a vehicle
*/
if ((lbCurSel 1500) isEqualTo -1) exitWith {["You need to select a vehicle.","orange"] call DT_fnc_notify};

private _plate = (parseSimpleArray (lbData[2802,(lbCurSel 2802)])) param [2];

[_plate,getPlayerUID player] remoteExecCall ["DB_fnc_soldVehicle",2];
["Destroyed vehicle."] call DT_fnc_notify;
closeDialog 0;