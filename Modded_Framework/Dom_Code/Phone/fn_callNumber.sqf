/*
	File: fn_callNumber.sqf
	Author: Dom
	Description: Calls a number via a keypad or contacts menu
*/
params [
	["_number","",[""]]
];
if (_number isEqualTo "") exitWith {["You didn't enter a number.","orange"] call DT_fnc_notify};

if (phone_callingPlayer) exitWith {["Your already calling someone.","orange"] call DT_fnc_notify};
if (phone_beingCalled) exitWith {["You are already being called.","orange"] call DT_fnc_notify};

if (_number isEqualTo "911") exitWith {
	private _toRing = objNull;
	{
		if (_x getVariable ["dispatch",false]) exitWith {
			_toRing = _x
		};
	} forEach playableUnits;

	if !(isNull _toRing) then {
		private _ownNumber = player getVariable ["phoneNumber",""];
		phone_callOwner = player;
		[_ownNumber,player] remoteExec ["DT_fnc_dispatchBeingCalled",_toRing];
		[] spawn {
			for "_i" from 0 to 5 do {
				if (phone_acceptedCall) exitWith {phone_callingPlayer = false; phone_inCall = true; ["911"] call DT_fnc_setFrequency}; 
				if (phone_denyedCall) exitWith {["Nobody picked up.","orange"] call DT_fnc_notify};
				["Calling 911.","blue"] call DT_fnc_notify;
				//playSound "call";
				sleep 3;
			};
			if (!phone_acceptedCall) exitWith {
				["Call failed (no response).","orange"] call DT_fnc_notify;
				phone_beingCalled = false; //safeguards
				phone_acceptedCall = false;
				phone_hungupCall = false;
				phone_callingPlayer = false;
			};
		};
	} else {
		["911 call failed, nobody picked up.","orange"] call DT_fnc_notify;
	};
};

if (count _number > 6) exitWith {["Invalid number, call failed.","orange"] call DT_fnc_notify};

private _toRing = objNull;
{
	_selNumber = _x getVariable ["phoneNumber",""];
	if (_selNumber isEqualTo _number) exitWith {
		_toRing = _x
	};
} forEach playableUnits;

if !(isNull _toRing) then {
	if (_toRing isEqualTo player) exitWith {["You can't call yourself.","orange"] call DT_fnc_notify;};
	private _ownNumber = player getVariable ["phoneNumber",""];
	if !(phone_inCall) then {
		phone_callOwner = player; //setting variable to use in dialogs (owner)
		player setVariable ["callTotal",1,-2];
		phone_callingPlayer = true;

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

		private _text = format["You are calling %1.",_number];
		if !(_name isEqualTo "") then {
			_text = format["You are calling %1 (%2).",_name,_number];
		};

		[_ownNumber,player] remoteExec ["DT_fnc_beingCalled",_toRing];
		[_number,_ownNumber,_text] spawn {
			params [
				["_number","",[""]],
				["_ownNumber","",[""]],
				["_text","",[""]]
			];
			for "_i" from 0 to 5 do {
				if (phone_acceptedCall) exitWith {phone_callingPlayer = false; phone_inCall = true; [_ownNumber] call DT_fnc_setFrequency; player setVariable ["callTotal",(player getVariable ["callTotal",0] + 1),-2]};
				if (phone_denyedCall) exitWith {[format["Call to %1 was denied.",_number],"red"] call DT_fnc_notify};
				[_text,"blue"] call DT_fnc_notify;
				//playSound "call";
				sleep 3;
			};
			if (!phone_acceptedCall) exitWith {
				["Call failed (no response).","red"] call DT_fnc_notify;
				phone_beingCalled = false; //safeguards
				phone_acceptedCall = false;
				phone_hungupCall = false;
				phone_callingPlayer = false;
			};
		};
	} else {
		if !(phone_callOwner isEqualTo player) exitWith {["Only the call owner can add people to the call.","orange"] call DT_fnc_notify};
		phone_callingPlayer = true;
		[_ownNumber,player] remoteExec ["DT_fnc_beingCalled",_toRing];
		[_number,_ownNumber] spawn {
			params [
				["_number","",[""]],
				["_ownNumber","",[""]]
			];
			for "_i" from 0 to 5 do {
				if (phone_acceptedCall) exitWith {phone_callingPlayer = false; player setVariable ["callTotal",(player getVariable ["callTotal",0] + 1),-2]};
				if (phone_denyedCall) exitWith {[format["Call to %1 was denied.",_number],"red"] call DT_fnc_notify};
				[format["Calling %1.",_number],"blue"] call DT_fnc_notify;
				//playSound "call";
				sleep 3;
			};
			if (!phone_acceptedCall) exitWith {
				["Call failed (no response).","red"] call DT_fnc_notify;
				phone_beingCalled = false; //safeguards
				phone_acceptedCall = false;
				phone_hungupCall = false;
				phone_callingPlayer = false;
			};
		};
	};
} else {
	["This number is not avaliable.","orange"] call DT_fnc_notify;
};