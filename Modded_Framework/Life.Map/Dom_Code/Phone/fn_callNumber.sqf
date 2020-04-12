/*
	File: fn_callNumber.sqf
	Author: Dom
	Description: Calls a number via a keypad or contacts menu
*/
params [
	["_number","",[""]]
];
if (_number isEqualTo "") exitWith {["You didn't enter a number.","orange"] call DT_fnc_notify};
scopeName "main";
if (phone_callingPlayer) exitWith {["You're already calling someone.","orange"] call DT_fnc_notify};
if (phone_beingCalled) exitWith {["You are already being called.","orange"] call DT_fnc_notify};
phone_targetNumber = _number;

if (count _number != 6 && _number != "911") exitWith {["Invalid number, call failed.","orange"] call DT_fnc_notify};
private _dispatch = _number isEqualTo "911";

private _toRing = objNull;
if (_dispatch) then {
	{
		if (_x getVariable ["dispatch",false]) exitWith {
			_toRing = _x
		};
	} forEach playableUnits;
	if (isNull _toRing) then {
		private _emergPers = ["cop"] call DT_fnc_findPlayers;
		_emergPers append (["medic"] call DT_fnc_findPlayers);
		_toRing = selectRandom _emergPers;
	};
} else {
	{
	_selNumber = _x getVariable ["phoneNumber",""];
		if (_selNumber isEqualTo _number) exitWith {
			_toRing = _x
		};
	} forEach playableUnits;
};

if !(isNull _toRing) then {
	if (_toRing isEqualTo player) exitWith {["You can't call yourself.","orange"] call DT_fnc_notify;};

	if (phone_inCall) then {
		if !(phone_callOwner isEqualTo player) exitWith {
			["Only the call owner can add people to the call.","orange"] call DT_fnc_notify;
			breakTo "main";
		};
	} else {
		player setVariable ["callTotal",1,true];
		phone_callOwner = player;
	};

	phone_callingPlayer = true;
	private _ownNumber = player getVariable ["phoneNumber",""];

	private _text = "";
	if (_dispatch) then {
		_text = "Calling 911!";
	} else {
		private _name = [_number] call DT_fnc_findContact;
		if (_name isEqualTo "") then {
			_text =  format["You are calling %1.",_number];
		} else {
			_text = format["You are calling %1 (%2).",_name,_number];
		};
	};

	[_ownNumber,player,_dispatch] remoteExecCall ["DT_fnc_beingCalled",_toRing];
	phone_handler = [
		{
			params ["_args"];
			_args params ["_count","_text"];
			if (_count isEqualTo 5) exitWith {
				["Call failed (no response).","red"] call DT_fnc_notify;
				call DT_fnc_endCall;
				[phone_handler] call CBA_fnc_removePerFrameHandler;
			};
			if (player getVariable ["callTotal",0] isEqualTo 0) exitWith {
				[phone_handler] call CBA_fnc_removePerFrameHandler;
			};
			[_text,"blue"] call DT_fnc_notify;
			_args set [0,(_count + 1)];
		},
		3,
		[0,_text]
	] call CBA_fnc_addPerFrameHandler;
} else {
	["This number is not avaliable.","orange"] call DT_fnc_notify;
};