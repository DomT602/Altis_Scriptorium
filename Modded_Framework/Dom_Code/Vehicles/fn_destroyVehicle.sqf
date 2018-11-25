/*
    File: fn_destroyVehicle.sqf
    Author: Dom
    Description: Destroys a vehicle
*/
private _index = lbCurSel 1500;
if (_index isEqualTo -1) exitWith {["You need to select a vehicle.","orange"] call DT_fnc_notify};

private _plate = (parseSimpleArray (lbData[1500,_index])) param [2];

[_plate,getPlayerUID player] remoteExecCall ["DB_fnc_soldVehicle",2];
["Destroyed vehicle."] call DT_fnc_notify;
closeDialog 0;