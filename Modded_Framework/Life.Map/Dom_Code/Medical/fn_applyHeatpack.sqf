/*
	File: fn_applyHeatpack.sqf
	Author: Dom
	Description: Applies a heatpack (or icepack) to the target
*/
params [
	["_heatpack",false,[false]]
];
([["D_IcePack_i","icepack",-3],["D_Heatpack_i","heatpack",3]] select _heatpack) params ["_item","_name","_heatChange"];
if !(_item in (magazines player)) exitWith {["You have no heatpacks.","orange"] call DT_fnc_notify};
private _animations = if (MB_Interaction_Target isEqualTo player) then {
	["AinvPknlMstpSlayWnonDnon_medic","AinvPpneMstpSlayWnonDnon_medic"]
} else {
	["AinvPknlMstpSlayWnonDnon_medicOther","AinvPpneMstpSlayWnonDnon_medicOther"]
};

[format["Applying %1",_name],2.5,_animations,"isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	params ["_item","_name","_heatChange"];
	player removeItem _item;
	if (MB_Interaction_Target isEqualTo player) then {
		[_heatChange,_item] call DT_fnc_recieveHeat;
	} else {
		[_heatChange,_item] remoteExecCall ["DT_fnc_recieveHeat",MB_Interaction_Target];
	};
	[MB_Interaction_Target,format["Applied %1",_name]] call DT_fnc_recordMedical;
	["Pack applied.","green"] call DT_fnc_notify;
	//[player,""] remoteExecCall ["switchMove",-2];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Applying cancelled."};
		case 2: {"You are dead."};
		case 3: {"Applying failed."};
	}),"orange"] call DT_fnc_notify;
},[_item,_name,_heatChange]] call DT_fnc_progressBar;