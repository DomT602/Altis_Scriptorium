/*
	File: fn_personGPS.sqf
	Author: Dom
	Description: Allows you to put a GPS tracker on another player
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit] call DT_fnc_checkPlayer) exitWith {};
if !("ItemGPS" in (items player)) exitWith {["You need a GPS.","orange"] call DT_fnc_notify};

["Attaching GPS",15,"AinvPknlMstpSnonWnonDnon_medic_1","isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	player removeItem "ItemGPS";
	["GPS Tracker attached.","green"] call DT_fnc_notify;
	MB_Interaction_Target setVariable ["tracked",true,false];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Attaching cancelled."};
		case 2: {"You are dead."};
		case 3: {"Attaching failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;