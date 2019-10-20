/*
	File: fn_respondCall.sqf
	Author: Dom
	Description: Changes phone state
*/
params [
  	["_accepted",false,[false]]
];
if !(phone_beingCalled) exitWith {["You are no longer being called.","orange"] call DT_fnc_notify};

closeDialog 0;
phone_beingCalled = false;
[phone_handler] call CBA_fnc_removePerFrameHandler;
if (_accepted) then {
	phone_inCall = true;
	["Connecting call.","blue"] call DT_fnc_notify;
	["callAccepted"] remoteExecCall ["DT_fnc_phoneStateChanged",phone_callOwner];
	if (phone_incNumber isEqualTo "Emergency") then {
		["911",2] call DT_fnc_setFrequency;
	} else {
		[phone_incNumber] call DT_fnc_setFrequency;
	};
} else {
	["callDenyed"] remoteExecCall ["DT_fnc_phoneStateChanged",phone_callOwner];
	["Call denied.","blue"] call DT_fnc_notify;
	call DT_fnc_openPhone;
};