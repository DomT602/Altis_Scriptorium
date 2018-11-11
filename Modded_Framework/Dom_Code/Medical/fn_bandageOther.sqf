/*
	File: fn_bandageOther.sqf
	Author: Dom
	Description: Bandages the target
*/
if !("D_Bandage_i" in (magazines player)) exitWith {["You have no bandages.","orange"] call DT_fnc_notify};

["Bandaging",2,["AinvPknlMstpSlayWnonDnon_medicOther","AinvPpneMstpSlayWnonDnon_medicOther"],"isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	player removeItem "D_Bandage_i";
	private _bleeding = _unit getVariable ["bleeding",0];
	_bleeding = (_bleeding - 2) max 0;
	MB_Interaction_Target setVariable ["bleeding",_bleeding,true];
	[MB_Interaction_Target,"Bandaged"] call DT_fnc_recordMedical;
	["Bandaging finished.","green"] call DT_fnc_notify;
	[player,""] remoteExecCall ["switchMove",-2];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Bandaging cancelled."};
		case 2: {"You are dead."};
		case 3: {"Bandaging failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;