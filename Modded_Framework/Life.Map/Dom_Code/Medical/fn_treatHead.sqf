/*
	File: fn_treatHead.sqf
	Author: Dom
	Description: Treats the targets head depending on facilities
*/

(call {
	if (player distance (getMarkerPos "LakesideEMS_Spawn") < 30) exitWith {[5,0,"You have fully treated the patients head injuries."]};
	if !((nearestObjects [player,["Jonzie_Ambulance"],25]) isEqualTo []) exitWith {[8,0.6,"You have treated the patient, take them to the hospital for further treatment."]};
	[11,0.9,"You have lightly treated the patient, take them to an ambulance or hospital for further treatment."]
}) params ["_time","_value","_text"];

if (_value > (MB_Interaction_Target getVariable ["injuries",[]] select 0)) exitWith {
	["You need more specialised equipment to treat the patient further.","blue"] call DT_fnc_notify;
};

["Treating",_time,"AinvPknlMstpSnonWnonDnon_medic4","isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	params [
		["_value",0,[0]],
		["_text","",[""]]
	];
	private _injuries = MB_Interaction_Target getVariable ["injuries",[]];
	_injuries set [0,_value];
	MB_Interaction_Target setVariable ["injuries",_injuries,true];
	[MB_Interaction_Target,"Treated head"] call DT_fnc_recordMedical;
	[_text,"green"] call DT_fnc_notify;
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
},[_value,_text]] call DT_fnc_progressBar;