/*
	File: fn_bloodBag.sqf
	Author: Dom
	Description: Puts the target on blood
*/
if !("D_BloodBag_i" in (magazines player)) exitWith {["You have no bloodbags.","orange"] call DT_fnc_notify};

["Applying bloodbag",5,["AinvPknlMstpSlayWnonDnon_medicOther","AinvPpneMstpSlayWnonDnon_medicOther"],"isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	player removeItem "D_BloodBag_i";
	[100] remoteExecCall ["DT_fnc_recieveBlood",MB_Interaction_Target];
	[MB_Interaction_Target,"Bloodbag applied"] call DT_fnc_recordMedical;
	["Bloodbag finished.","green"] call DT_fnc_notify;
	[player,""] remoteExecCall ["switchMove",-2];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Bloodbag cancelled."};
		case 2: {"You are dead."};
		case 3: {"Bloodbag failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;