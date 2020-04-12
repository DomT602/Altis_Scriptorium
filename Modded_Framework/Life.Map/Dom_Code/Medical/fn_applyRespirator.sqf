/*
	File: fn_applyRespirator.sqf
	Author: Dom
	Description: Puts the target on a respirator
*/

//if !("D_Respirator_i" in (magazines player)) exitWith {["You have no respirator.","orange"] call DT_fnc_notify};

["Applying",1,"","isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	[player] remoteExecCall ["DT_fnc_onRespirator",MB_Interaction_Target];
	[MB_Interaction_Target,"Respirator applied"] call DT_fnc_recordMedical;
	private _name = ["someone",MB_Interaction_Target] call DT_fnc_findName;
	[format["You applied a respirator to %1.",_name],"green"] call DT_fnc_notify;
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Respirator cancelled."};
		case 2: {"You are dead."};
		case 3: {"Respirator failed."};
	}),"orange"] call DT_fnc_notify;
},[_selection]] call DT_fnc_progressBar;