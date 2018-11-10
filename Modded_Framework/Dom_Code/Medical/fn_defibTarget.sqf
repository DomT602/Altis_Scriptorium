/*
	File: fn_defibTarget.sqf
	Author: Dom
	Description: Defibrillates the targeted player
*/
params [
    ["_target",objNull,[objNull]]
];
if !([_unit] call DT_fnc_checkPlayer) exitWith {};
if !("D_Defibrillator_i" in (magazines player)) exitWith {["You don't have a defibrillator.","orange"] call DT_fnc_notify};

if (_target getVariable ["Reviving",objNull] isEqualTo player) exitWith {};
_target setVariable ["Reviving",player,true];

["Reviving",7.6,"AinvPknlMstpSnonWnonDnon_medic4","isNull objectParent player && !([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	MB_Interaction_Target setVariable ["Reviving",nil,true];
	if (_target getVariable ["blood",0] isEqualTo 0 || {_target getVariable ["head",1] isEqualTo 1}) exitWith {["Defibrillation failed.","orange"] call DT_fnc_notify};
	remoteExec ["DT_fnc_revived",MB_Interaction_Target];
	[format["You were paid $%1 for medical fees.",str(_reviveCost)],"blue"] call DT_fnc_notify;
	[MB_Interaction_Target,"Defibrillated"] call DT_fnc_recordMedical;
	client_bank = client_bank + 500;
	[0] call DT_fnc_saveStatsPartial;
	[player,""] remoteExecCall ["switchMove",-2];
},
{
	params [
		["_state",0,[0]]
	];
	MB_Interaction_Target setVariable ["Reviving",nil,true];
	[(switch _state do {
		case 1: {"Reviving cancelled."};
		case 2: {"You are dead."};
		case 3: {"Reviving failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;
