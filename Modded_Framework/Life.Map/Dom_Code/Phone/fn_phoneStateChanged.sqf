/*
	File: fn_phoneStateChanged.sqf
	Author: Dom
	Description: Changes phone state
*/
params [
	["_state","",[""]]
];

switch _state do {
	case "callAccepted": {
		phone_inCall = true;
		phone_callingPlayer = false;
		["Connecting call.","blue"] call DT_fnc_notify;
		[phone_handler] call CBA_fnc_removePerFrameHandler;
		player setVariable ["callTotal",(player getVariable ["callTotal",0]) + 1,true];
		if (phone_targetNumber isEqualTo "911") then {
			["911"] call DT_fnc_setFrequency;
		} else {
			//check if I need to set number again
			[player getVariable ["phoneNumber",""]] call DT_fnc_setFrequency;
		};
	};
	case "callerHungup": {
		player setVariable ["callTotal",(player getVariable ["callTotal",0]) - 1,true];
		if (player getVariable ["callTotal",0] < 2) then {
			["Call ended.","blue"] call DT_fnc_notify;
			call DT_fnc_endCall;
		} else {
			["Someone left the call.","blue"] call DT_fnc_notify;
		};
	};
	case "callDenyed": {
		phone_callingPlayer = false;
		["Recipient denied the call.","blue"] call DT_fnc_notify;
		[phone_handler] call CBA_fnc_removePerFrameHandler;
		if (player getVariable ["callTotal",0] < 2) then {
			call DT_fnc_endCall;
		};
	};
	case "callFailed": {
		["Recipient is already being called.","blue"] call DT_fnc_notify;
		[phone_handler] call CBA_fnc_removePerFrameHandler;
		if (player getVariable ["callTotal",0] < 2) then {
			call DT_fnc_endCall;
		};
	};
};