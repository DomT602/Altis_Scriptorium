/*
	File: fn_transferVehicle.sqf
	Author: Dom
	Description: Sends request to the server to swap vehicle owner
*/
params [
	["_unit",objNull,[objNull]]
];
private _index = lbCurSel 1500;
if (_index isEqualTo -1) exitWith {["You need to select a vehicle.","orange"] call DT_fnc_notify};
if !(isPlayer _unit) exitWith {};
private _plate = lbData[1500,_index];

[_plate,getPlayerUID _unit] remoteExecCall ["DB_fnc_transferVehicle",2];
["You have transferred the selected vehicle."] call DT_fnc_notify;
["You have recieved a new vehicle, check your garage."] remoteExecCall ["DT_fnc_notify",_unit];