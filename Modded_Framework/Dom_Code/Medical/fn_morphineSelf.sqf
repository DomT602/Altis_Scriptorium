/*
	File: fn_morphineSelf.sqf
	Author: Dom
	Description: Injects morphine into player
*/
if !("D_Morphine_i" in (magazines player)) exitWith {["You have no morphine.","orange"] call DT_fnc_notify};

["Applying morphine",1,["AinvPknlMstpSlayWnonDnon_medic","AinvPpneMstpSlayWnonDnon_medic"],"true",
{
	player removeItem "D_Morphine_i";
	[player,"Morphine administered"] call DT_fnc_recordMedical;
	call DT_fnc_onMorphine;
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