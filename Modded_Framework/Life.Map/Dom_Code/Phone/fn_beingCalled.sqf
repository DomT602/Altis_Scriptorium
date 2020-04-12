/*
	File: fn_beingCalled.sqf
	Author: Dom
	Description: Recieves a call from a player
*/
if (!([player] call TFAR_fnc_hasRadio) || (player getVariable ["phoneBattery",100]) isEqualTo 0) exitWith {};
	
params [
	["_number","",[""]],
	["_caller",objNull,[objNull]],
	["_dispatch",false,[false]]
];
if (_number isEqualTo "" || {isNull _caller}) exitWith {};

if (phone_beingCalled || phone_inCall) exitWith {["callFailed"] remoteExecCall ["DT_fnc_phoneStateChanged",_caller]};
phone_callOwner = _caller;
phone_beingCalled = true;
phone_incNumber = _number;

private _text = "";
if (_dispatch) then {
	_text = format["Dispatch is being called by %1.",_number];
	phone_incNumber = "Emergency";
} else {
	private _name = [_number] call DT_fnc_findContact;

	_text = if (_name isEqualTo "") then {
		format["You are being called by %1.",_number];
	} else {
		format["You are being called by %1 (%2).",_name,_number];
	};
};

phone_handler = [
	{
		params ["_args"];
		_args params ["_count","_text"];
		if (_count isEqualTo 5) exitWith {
			[phone_handler] call CBA_fnc_removePerFrameHandler;
			phone_beingCalled = false;
			if !(isNull (findDisplay 1032)) then {
				closeDialog 0;
			};
		};
		if (phone_callOwner getVariable ["callTotal",0] isEqualTo 0) exitWith {
			[phone_handler] call CBA_fnc_removePerFrameHandler;
		};
		[_text,"blue"] call DT_fnc_notify;
		_args set [0,(_count + 1)];
		//[player,[(phone_settings select 1),50,1]] remoteExecCall ["say3D",-2];
	},
	3,
	[0,_text]
] call CBA_fnc_addPerFrameHandler;