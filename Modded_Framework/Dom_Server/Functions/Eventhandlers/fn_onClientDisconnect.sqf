/*
    File: fn_onClientDisconnect.sqf
    Author: Dom
    Description: Syncs position on client disconnect
*/
params [
    ["_unit",objNull,[objNull]],
    "",
    ["_uid","",[""]]
];
if (isNull _unit) exitWith {};

private _position = getPosATL _unit;
private _alive = if (_unit getVariable ["dead",false]) then {0} else {1};
if (_alive isEqualTo 0) then {
	[_unit,"Combat Logged",true] call server_fnc_logAction;
};

deleteVehicle _unit;

[format["clientDisconnect:%1:%2:%3",_alive,_position,_uid],1] call MySQL_fnc_DBasync;