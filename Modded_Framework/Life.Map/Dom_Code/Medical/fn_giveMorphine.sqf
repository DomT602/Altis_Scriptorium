/*
	File: fn_giveMorphine.sqf
	Author: Dom
	Description: Puts the target on morphine
*/
if !("D_Morphine_i" in (magazines player)) exitWith {["You have no morphine.","orange"] call DT_fnc_notify};

private _animations = if (MB_Interaction_Target isEqualTo player) then {
	["AinvPknlMstpSlayWnonDnon_medic","AinvPpneMstpSlayWnonDnon_medic"]
} else {
	["AinvPknlMstpSlayWnonDnon_medicOther","AinvPpneMstpSlayWnonDnon_medicOther"]
};

["Applying morphine",1,_animations,"isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	player removeItem "D_Morphine_i";
	if (MB_Interaction_Target isEqualTo player) then {
		call DT_fnc_onMorphine;
	} else {
		remoteExecCall ["DT_fnc_onMorphine",MB_Interaction_Target];
	};
	[MB_Interaction_Target,"Morphine administered"] call DT_fnc_recordMedical;
	["Morphine applied.","green"] call DT_fnc_notify;
	[player,""] remoteExecCall ["switchMove",-2];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Morphine cancelled."};
		case 2: {"You are dead."};
		case 3: {"Morphine failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;