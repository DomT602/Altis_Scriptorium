/*
	File: fn_treatHead.sqf
	Author: Dom
	Description: Treats the targets head depending on facilities
*/
params [
	["_type","",[""]]
];

(switch _treatment do {
	case "hospital": {[5,0,"You have fully treated the patients head injuries."]};
	case "ambulance": {[10,0.6,"You have treated the patient, take them to the hospital for further treatment."]};
	case "none": {[20,0.9,"You have lightly treated the patient, take them to an ambulance or hospital for further treatment."]};
}) params ["_time","_value","_text"];

if (_value > MB_Interaction_Target getVariable ["head",0]) exitWith {
	["You need more specialised equipment to treat the patient further.","blue"] call DT_fnc_notify;
};

["Treating",_time,"AinvPknlMstpSnonWnonDnon_medic4","isNull objectParent player && ([MB_Interaction_Target] call DT_fnc_checkPlayer)",
{
	params [
		["_value",0,[0]],
		["_text","",[""]]
	];
	
	MB_Interaction_Target setVariable ["head",_value,-2];
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
},
[_value,_text]] call DT_fnc_progressBar;

