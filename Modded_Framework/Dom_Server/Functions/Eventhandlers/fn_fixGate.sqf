/*
	File: fn_fixGate.sqf
	Author: Dom
	Description: Fixes the prison gate
*/
params [
	["_oldGate",objNull,[objNull]]
];

private _pos = getPosATL _oldGate;
private _dir = getDir _oldGate;
deleteVehicle _oldGate;
private _gate = createVehicle ["Land_PrisonGate",_pos,[],0,"CAN_COLLIDE"];
_gate setPosATL _pos;
_gate setDir _dir;