/*
    File: fn_repairVehicle.sqf
    Author: Dom
    Description: Repairs a vehicle
*/

params [
	["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle || {player distance _vehicle > 3}) exitWith {};
if !("ToolKit" in (items player)) exitWith {["You need a toolkit.","orange"] call DT_fnc_notify};

["Repairing",10,"Acts_carFixingWheel","isNull objectParent player && player distance MB_Interaction_Target < 5",
{
	player removeItem "ToolKit";
	["Repairing finished.","green"] call DT_fnc_notify;
	MB_Interaction_Target setDamage 0;
	[player,""] remoteExecCall ["switchMove",-2];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Repairing cancelled."};
		case 2: {"You are dead."};
		case 3: {"Repairing failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;