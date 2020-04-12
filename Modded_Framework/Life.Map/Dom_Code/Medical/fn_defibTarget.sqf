/*
	File: fn_defibTarget.sqf
	Author: Dom
	Description: Defibrillates the targeted player
*/
params [
	["_target",objNull,[objNull]]
];
if !([_target] call DT_fnc_checkPlayer) exitWith {};
if !("D_Defibrillator_i" in (magazines player)) exitWith {["You don't have a defibrillator.","orange"] call DT_fnc_notify};

if !(isNull (_target getVariable ["reviving",objNull])) exitWith {["Someone else is reviving this person."] call DT_fnc_notify};
_target setVariable ["reviving",player,true];

["Reviving",7.692,"AinvPknlMstpSnonWnonDnon_medic4","isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	MB_Interaction_Target setVariable ["reviving",nil,true];
	if (MB_Interaction_Target getVariable ["blood",0] isEqualTo 0 || {(MB_Interaction_Target getVariable ["injuries",[]] select 0) isEqualTo 1} || (MB_Interaction_Target getVariable ["bodyTemp",37] < 35)) exitWith {["Defibrillation failed.","orange"] call DT_fnc_notify};
	remoteExecCall ["DT_fnc_revived",MB_Interaction_Target];
	["You were paid $500 for medical fees.","blue"] call DT_fnc_notify;
	[MB_Interaction_Target,"Defibrillated"] call DT_fnc_recordMedical;
	["bank",500] call DT_fnc_handleMoney;
	//[player,""] remoteExecCall ["switchMove",-2];
},
{
	params [
		["_state",0,[0]]
	];
	MB_Interaction_Target setVariable ["reviving",nil,true];
	[(switch _state do {
		case 1: {"Reviving cancelled."};
		case 2: {"You are dead."};
		case 3: {"Reviving failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;
