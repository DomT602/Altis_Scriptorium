/*
	File: fn_treatSelf.sqf
	Author: Dom
	Description: Treats the player
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
if (player getVariable [_part,0] > 0.5) then {_time = 5};

if !(_item in (magazines player)) exitWith {["You don't have the necessary item.","orange"] call DT_fnc_notify};

["Treating",_time,["AinvPknlMstpSlayWnonDnon_medic","AinvPpneMstpSlayWnonDnon_medic"],"true",
{
	params [
		["_item","",[""]],
		["_part","",[""]],
		["_text","",[""]]
	];
	player removeItem _item;
	player setVariable [_part,0,true]; 
	[player,_text] call DT_fnc_recordMedical;
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