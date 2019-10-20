/*
	File: fn_treatPart.sqf
	Author: Dom
	Description: Treats specified part of target's body
*/
params [
	["_selection",2,[0]]
];

private _data = call {
	//if (_selection isEqualTo 1) exitWith {}; torso
	if (_selection in [2,3]) exitWith {["D_Cast_i","Cast"]}; 
	["D_Splint_i","Splint"]
};
_data params ["_item","_text"];

private _time = (MB_Interaction_Target getVariable ["injuries",[]] select _selection) * 5;

if !(_item in (magazines player)) exitWith {["You don't have the necessary item.","orange"] call DT_fnc_notify};
private _animations = if (MB_Interaction_Target isEqualTo player) then {
	["AinvPknlMstpSlayWnonDnon_medic","AinvPpneMstpSlayWnonDnon_medic"]
} else {
	["AinvPknlMstpSlayWnonDnon_medicOther","AinvPpneMstpSlayWnonDnon_medicOther"]
};

["Treating",_time,_animations,"isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	params [
		["_item","",[""]],
		["_text","",[""]],
		["_selection",2,[0]]
	];
	player removeItem _item;
	private _injuries = MB_Interaction_Target getVariable ["injuries",[]];
	_injuries set [_selection,0];
	MB_Interaction_Target setVariable ["injuries",_injuries,true];
	[MB_Interaction_Target,_text] call DT_fnc_recordMedical;
	["Treatment finished.","green"] call DT_fnc_notify;
	//[player,""] remoteExecCall ["switchMove",-2];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Treatment cancelled."};
		case 2: {"You are dead."};
		case 3: {"Treatment failed."};
	}),"orange"] call DT_fnc_notify;
},[_item,_text,_selection]] call DT_fnc_progressBar;