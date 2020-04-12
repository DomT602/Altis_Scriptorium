/*
	File: fn_lockpick.sqf
	Author: Dom
	Description: Starts lockpick process
*/
params [
	["_target",objNull,[objNull]]
];

if (isNull _target || client_blockActions || !(isNull objectParent player)) exitWith {};

private _time = call {
	if (isPlayer _target) exitWith {15};
	if (_target isKindOf 'Car' || {_target isKindOf 'Air'} || {_target isKindOf 'Ship'}) exitWith {20};
	30 //door
};
//sound
["Lockpicking",_time,"AinvPknlMstpSnonWnonDnon_medic_1","isNull objectParent player && player distance MB_Interaction_Target < 5 && !(isNull MB_Interaction_Target)",
{
	["Lockpicking finished.","green"] call DT_fnc_notify;
	if (isPlayer MB_Interaction_Target) then {
		MB_Interaction_Target setVariable ["restrained",false,true];
	} else {
		if (MB_Interaction_Target isKindOf 'Car' || {MB_Interaction_Target isKindOf 'Air'} || {MB_Interaction_Target isKindOf 'Ship'}) then {
			[MB_Interaction_Target,0] remoteExecCall ["lock",MB_Interaction_Target];
		} else {
			
		};
	};
	[player,""] remoteExecCall ["switchMove",-2];
	
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Lockpicking cancelled."};
		case 2: {"You are dead."};
		case 3: {"Lockpicking failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;