/*
	File: fn_morphineOther.sqf
	Author: Dom
	Description: Puts the target on morphine
*/
if !("D_Morphine_i" in (magazines player)) exitWith {["You have no morphine.","orange"] call DT_fnc_notify};

["Applying morphine",1,["AinvPknlMstpSlayWnonDnon_medicOther","AinvPpneMstpSlayWnonDnon_medicOther"],"isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	player removeItem "D_Morphine_i";
	remoteExecCall ["DT_fnc_onMorphine",MB_Interaction_Target];
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