/*
	File: fn_govFreq.sqf
	Author: Dom
	Description: Changes frequency to one of the emergency services freqs
*/

params [
	["_type","",[""]]
];

if (phone_beingCalled || phone_inCall) exitWith {["Finish your current call first.","orange"] call DT_fnc_notify};

(switch _type do {
	case "police": {["33.0","You are on the main police frequency."]};
	case "ems": {["33.3","You are on the main EMS frequency."]};
	case "joint": {["33.2","You are on the joint PD/EMS frequency."]};
}) params ["_freq","_message"];
[(call TFAR_fnc_activeSwRadio),2,_freq] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio),1] call TFAR_fnc_setSwChannel;
call TFAR_fnc_HideHint;
[_message,"blue"] call DT_fnc_notify;