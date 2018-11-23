/*
	File: fn_beingCalled.sqf
	Author: Dom
	Description: Recieves a call from a player
*/
private _radios = player call TFAR_fnc_radiosList;
if (_radios isEqualTo [] || phone_battery isEqualTo 0) exitWith {};
	
params [
	["_number","",[""]],
	["_caller",objNull,[objNull]]
];
if (_number isEqualTo "" || {isNull _caller}) exitWith {};

if (phone_beingCalled) exitWith {["callFailed"] remoteExecCall ["DT_fnc_phoneStateChanged",_caller]};
phone_callOwner = _caller;
phone_beingCalled = true;

private _name = "";
{
	_x params [
		["_cName","",[""]],
		["_cNumber","",[""]]
	];
	
	if (_cNumber isEqualTo _number) exitWith {
		_name = _cName
	};
} forEach phone_contacts;

private _text = format["You are being called by %1.",_number];
if !(_name isEqualTo "") then {
	_text = format["You are being called by %1 (%2).",_name,_number];
};

[_number,_text] spawn {
	params [
		["_number","",[""]],
		["_text","",[""]]
	];
	for "_i" from 0 to 5 do {
		if (phone_acceptedCall) exitWith {
			["callAccepted"] remoteExecCall ["DT_fnc_phoneStateChanged",phone_callOwner]; //if you press accept (green button on phone) then lets change to caller's frequency and send message to caller
			phone_inCall = true;
			[_number] call DT_fnc_setFrequency;
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

		if (phone_denyedCall) exitWith {["Call denied.","blue"] call DT_fnc_notify;};      
		[_text,"blue"] call DT_fnc_notify;
		player say3D [phone_settings select 2,75,1];
		sleep 4;
	};
	phone_beingCalled = false;
	phone_acceptedCall = false;
	phone_hungupCall = false;
};