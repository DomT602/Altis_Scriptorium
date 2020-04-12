/*
	File: fn_pushVehicle.sqf
	Author: Dom
	Description: Pushes a vehicle
*/
params [
	["_vehicle",objNull,[objNull]]
];

if !([_vehicle,5] call DT_fnc_checkVehicle) exitWith {};

["Pushing",3,"AinvPknlMstpSnonWnonDnon_medic_1","isNull objectParent player && ([MB_Interaction_Target,5] call DT_fnc_checkVehicle)",
{
	(velocity MB_Interaction_Target) params ["_xVel","_yVel","_zVel"];
	private _dir = direction player;
	[player,""] remoteExecCall ["switchMove",-2];
	MB_Interaction_Target setVelocity [_xVel + (sin _dir * 5),_yVel + (cos _dir * 5),_zVel];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Pushing cancelled."};
		case 2: {"You are dead."};
		case 3: {"Pushing failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;