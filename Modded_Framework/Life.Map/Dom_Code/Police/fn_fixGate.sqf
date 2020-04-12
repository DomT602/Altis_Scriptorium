/*
	File: fn_fixGate.sqf
	Author: Dom
	Description: Starts fixing a gate
*/
["Repairing",15,"AinvPknlMstpSnonWnonDnon_medic_1","isNull objectParent player && (player distance MB_Interaction_Target < 5) && !(isNull MB_Interaction_Target)",
{
	[MB_Interaction_Target] remoteExecCall ["server_fnc_fixGate",2];
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