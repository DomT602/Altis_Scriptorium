/*
	File: fn_treatOther.sqf
	Author: Dom
	Description: Treats the target
*/
params [
	["_treatment","splint",[""]]
];

(switch _treatment do {
	case "splint": {["D_Splint_i","legs","Splint"]};
	case "cast": {["D_Cast_i","arms","Cast"]};
	//something for torso?
}) params ["_item","_part","_text"];
private _time = 3;
if (MB_Interaction_Target getVariable [_part,0] > 0.5) then {_time = 5};

if !(_item in (magazines player)) exitWith {["You don't have the necessary item.","orange"] call DT_fnc_notify};

["Treating",_time,["AinvPknlMstpSlayWnonDnon_medicOther","AinvPpneMstpSlayWnonDnon_medicOther"],"isNull objectParent player && !([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	params [
		["_item","",[""]],
		["_part","",[""]],
		["_text","",[""]]
	];
	player removeItem _item;
	_unit setVariable [_part,0,true];
	[MB_Interaction_Target,_text] call DT_fnc_recordMedical;
	["Treatment finished.","green"] call DT_fnc_notify;
	[player,""] remoteExecCall ["switchMove",-2];
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
},
[_item,_part,_text]] call DT_fnc_progressBar;