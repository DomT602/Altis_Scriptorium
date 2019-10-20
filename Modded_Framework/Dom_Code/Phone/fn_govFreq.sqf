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
	case "cop": {["33.0","You are on the main police frequency."]};
	case "medic": {["33.3","You are on the main EMS frequency."]};
	case "joint": {["33.2","You are on the joint PD/EMS frequency."]};
}) params ["_freq","_message"];
private _radio = call TFAR_fnc_activeSwRadio;
[_radio,1,_freq] call TFAR_fnc_SetChannelFrequency;
[_radio,0] call TFAR_fnc_setSwChannel;
[_message] call DT_fnc_notify;