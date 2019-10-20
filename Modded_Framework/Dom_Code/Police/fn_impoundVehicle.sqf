/*
	File: fn_impoundVehicle.sqf
	Author: Dom
	Description: Starts impounding process
*/
params [
	["_vehicle",objNull,[objNull]]
];

if !([_vehicle,5] call DT_fnc_checkVehicle) exitWith {};

["Impounding",5,"","isNull objectParent player && ([MB_Interaction_Target,5] call DT_fnc_checkVehicle)",
{
	if (MB_Interaction_Target in client_keys) then {
		["You impounded your own vehicle.","green"] call DT_fnc_notify;
	} else {
		["bank",500] call DT_fnc_handleMoney;
		["You recieved $500 for impounding the vehicle.","green"] call DT_fnc_notify;
	};
	private _impound = if (player getVariable ["faction","civ"] isEqualTo "cop");
	[MB_Interaction_Target,_impound] remoteExecCall ["DB_fnc_storeVehicle",2];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Impounding cancelled."};
		case 2: {"You are dead."};
		case 3: {"Impounding failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;