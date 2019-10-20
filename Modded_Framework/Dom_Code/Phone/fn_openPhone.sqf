/*
	File: fn_openPhone.sqf
	Author: Dom
	Description: Opens and sets up phone
*/
if !([player] call TFAR_fnc_hasRadio) exitWith {["You don't have a phone.","orange"] call DT_fnc_notify};
if ((player getVariable ["phoneBattery",100]) isEqualTo 0) exitwith {["Your phone won't turn on.","red"] call DT_fnc_notify};
if (dialog) exitWith {};

if (phone_beingCalled) then {
	createDialog "DT_incomingCall";
	private _name = [phone_incNumber] call DT_fnc_findContact;
	private _callingInfo = format["%1<br/>%2",_name,phone_incNumber];
	((findDisplay 1032) displayCtrl 1102) ctrlSetStructuredText parseText _callingInfo;
} else {
	createDialog "DT_phoneMain";
	if (!phone_inCall && !phone_callingPlayer) then {
		ctrlShow [1103,false]; //don't show green/red buttons
		ctrlShow [1209,false];
		ctrlShow [1606,false];
	};
};
((findDisplay phone_appOpen) displayCtrl 1200) ctrlSetText (phone_settings select 0);

[
	{
		if (phone_appOpen isEqualTo -1) exitWith {
			[_this select 1] call CBA_fnc_removePerFrameHandler;
		};
		if ((player getVariable ["phoneBattery",100]) isEqualTo 0) exitWith {
			closeDialog 0;
			[_this select 1] call CBA_fnc_removePerFrameHandler;
			["Your phone ran out of battery.","orange"] call DT_fnc_notify;
		};
		[phone_appOpen] call DT_fnc_updatePhone;
	},
	1
] call CBA_fnc_addPerFrameHandler;