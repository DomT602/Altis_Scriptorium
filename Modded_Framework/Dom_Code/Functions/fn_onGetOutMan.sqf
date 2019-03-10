/*
	File: fn_onGetOutMan.sqf
	Author: Dom
	Description: Handles hopping out a vehicle
*/
params [
	"",
	"",
	["_vehicle",objNull,[objNull]]
];

if (_vehicle getVariable ["siren",false] && {police_autoSirens}) then {_vehicle setVariable ["siren",false,true]};
if !(_vehicle isKindOf "Car") exitWith {client_seatbelt = false};

private _time = if (client_seatbelt) then {
	time + 1.5;
} else {
	time + 0.75;
};
client_seatbelt = false;

[
	{
		params ["_time"];
		if (_time < time) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};
		if !(currentWeapon player isEqualTo "") then {
			player action ["SwitchWeapon",player,player,100];
			[player,"AmovPercMstpSnonWnonDnon"] remoteExecCall ["switchMove",-2];
		};
	},
	0,
	_time
] call CBA_fnc_addPerFrameHandler;