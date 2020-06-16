/*
	File: fn_onGetOutMan.sqf
	Author: Dom
	Description: Handles hopping out a vehicle
*/
params [
	"",
	["_role","",[""]],
	["_vehicle",objNull,[objNull]]
];

if (_vehicle getVariable ["siren",false] && {_role isEqualTo "driver" && {police_autoSirens}}) then {_vehicle setVariable ["siren",false,true]};
if !(_vehicle isKindOf "Car") exitWith {client_seatbelt = false};

private _time = 0.75;
if (client_seatbelt) then {
	_time = 1.5;
	client_seatbelt = false;
};

if (phone_charging) then {phone_charging = false};
["seatbelt"] call DT_fnc_updateHUDPartial;

if (typeOf client_carrying isEqualTo "Land_Sleeping_bag_blue_folded_F") then {
	[client_carrying,false] remoteExecCall ["hideObjectGlobal",2];
};

[
	{
		if !(currentWeapon player isEqualTo "") then {
			player action ["SwitchWeapon",player,player,100];
		};
		player getVariable ["dead",false]
	},
	{
		true
	},
	0,
	_time
] call CBA_fnc_waitUntilAndExecute;