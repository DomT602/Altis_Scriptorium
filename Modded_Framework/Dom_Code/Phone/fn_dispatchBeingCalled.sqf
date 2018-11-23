/*
	File: fn_beingCalled.sqf
	Author: Dom
	Description: Recieves a call from a player going to dispatch
*/
private _radios = player call TFAR_fnc_radiosList;
if (_radios isEqualTo [] || phone_battery isEqualTo 0) exitWith {};
	
params [
	["_number","",[""]],
	["_caller",objNull,[objNull]]
];
if (_number isEqualTo "" || {isNull _caller}) exitWith {};

if (phone_beingCalled || phone_inCall) exitWith {["callFailed"] remoteExecCall ["DT_fnc_phoneStateChanged",_caller]};
phone_callOwner = _caller;

phone_beingCalled = true;
[_number] spawn {
	params [
		["_number","",[""]]
	];
	for "_i" from 0 to 5 do {
		if (phone_acceptedCall) exitWith {
			phone_inCall = true;
			["callAccepted"] remoteExecCall ["DT_fnc_phoneStateChanged",phone_callOwner];
			["911"] call DT_fnc_setFrequency;
		};

		if (phone_hungupCall) exitWith {
			["Call finished.","blue"] call DT_fnc_notify;
			phone_beingCalled = false;
			phone_acceptedCall = false;
			phone_hungupCall = false;
		};

		if (phone_inCall) exitWith {
			[format["You missed a call from %1.",_number],"orange"] call DT_fnc_notify;
			phone_beingCalled = false;
			phone_acceptedCall = false;
			phone_hungupCall = false;
		};

		if (phone_denyedCall) exitWith {["Call denied.","blue"] call DT_fnc_notify};       
		[format["Dispatch is being called by %1.",_number],"blue"] call DT_fnc_notify;
		player say3D [phone_settings select 2,75,1];
		sleep 4;
	};
	phone_beingCalled = false;
	phone_acceptedCall = false;
	phone_hungupCall = false;
};