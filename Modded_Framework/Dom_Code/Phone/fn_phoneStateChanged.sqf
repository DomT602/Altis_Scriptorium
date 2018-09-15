/*
	File: fn_requestReceived.sqf
	Author: Dom
	Description: Changes phone state
*/
params [
  	["_state","",[""]]
];

switch _state do {
  	case "callAccepted": {
  		phone_acceptedCall = true;
      	["Connecting call.","blue"] call DT_fnc_notify;
  	};
  	case "callerHungup": {
  		player setVariable ["callTotal",(player getVariable ["callTotal",0] - 1),true];
	  	if (player getVariable ["callTotal",0] < 2) then {
	  		phone_hungupCall = true;
	      	["Call ended.","blue"] call DT_fnc_notify;
	      	call DT_fnc_endCall;
	  	} else {
	  		phone_hungupCall = true;
	      	["Someone left the call.","blue"] call DT_fnc_notify;
	  	};
	};
  	case "callDenyed": {
	  	if (player getVariable ["callTotal",0] < 2) then {
	  		phone_denyedCall = true;
	      	["Recipient denied the call.","blue"] call DT_fnc_notify;
	      	call DT_fnc_endCall;
	  	} else {
	  		phone_denyedCall = true;
	      	["Recipient denied the call.","blue"] call DT_fnc_notify;
	  	};
	};
  	case "callFailed": {
	  	if (player getVariable ["callTotal",0] < 2) then {
	  		phone_hungupCall = true;
	      	["Recipient is already being called.","blue"] call DT_fnc_notify;
	      	call DT_fnc_endCall;
	  	} else {
	  		phone_hungupCall = true;
	      	["Recipient is already being called.","blue"] call DT_fnc_notify;
	  	};
	};
};