/*
	File: fn_bandage.sqf
	Author: Dom
	Description: Bandages the target
*/
params [
	["_selection",0,[0]]
];
if !("D_Bandage_i" in (magazines player)) exitWith {["You have no bandages.","orange"] call DT_fnc_notify};
private _animations = if (MB_Interaction_Target isEqualTo player) then {
	["AinvPknlMstpSlayWnonDnon_medic","AinvPpneMstpSlayWnonDnon_medic"]
} else {
	["AinvPknlMstpSlayWnonDnon_medicOther","AinvPpneMstpSlayWnonDnon_medicOther"]
};

["Bandaging",2,_animations,"isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	params [
		["_selection",0,[0]]
	];
	player removeItem "D_Bandage_i";
	private _bleeding = MB_Interaction_Target getVariable ["bleeding",[]];
	_bleeding set [_selection,0];
	MB_Interaction_Target setVariable ["bleeding",_bleeding,true];
	[MB_Interaction_Target,"Bandaged"] call DT_fnc_recordMedical;
	["Bandaging finished.","green"] call DT_fnc_notify;
	//[player,""] remoteExecCall ["switchMove",-2];
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
},[_selection]] call DT_fnc_progressBar;