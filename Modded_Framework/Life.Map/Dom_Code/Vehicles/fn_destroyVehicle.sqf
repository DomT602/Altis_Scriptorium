/*
	File: fn_destroyVehicle.sqf
	Author: Dom
	Description: Destroys a vehicle
*/
private _index = lbCurSel 1500;
if (_index isEqualTo -1) exitWith {["You need to select a vehicle.","orange"] call DT_fnc_notify};
private _plate = lbData[1500,_index];

private _action = [
	format ["Are you sure you want to destroy the vehicle with plate: %1?",_plate],
	"Destroy Vehicle",
	"Yes",
	"Cancel"
] call BIS_fnc_guiMessage;
if (_action) then {
	[_plate] remoteExecCall ["DB_fnc_soldVehicle",2];
	["Destroyed vehicle."] call DT_fnc_notify;
	closeDialog 0;
};