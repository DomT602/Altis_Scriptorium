/*
	File: fn_openPhone.sqf
	Author: Dom
	Description: Opens and sets up phone
*/
private _radios = player call TFAR_fnc_radiosList;
if (_radios isEqualTo []) exitWith {["You don't have a phone.","orange"] call DT_fnc_notify};

if (phone_battery isEqualTo 0) exitwith {createDialog "emptyphone"};

createDialog "phone";
private _phone = uiNamespace getVariable ["DT_Phone",displayNull];
(_phone displayCtrl 5521) ctrlSetText (phone_settings select 1);

if (phone_beingCalled && {!phone_acceptedCall} && {!phone_hungupCall}) then {

} else {
	if (phone_inCall || phone_callingPlayer) then {
		(_phone displayCtrl 2020) buttonSetAction "call DT_fnc_endCall; ['Ended call.','blue'] call DT_fnc_notify; ['callerHungup'] remoteExecCall ['DT_fnc_phoneCallStateChange',phone_callOwner]; closeDialog 0;";
	} else {
		ctrlShow [1223,false]; //don't show green/red buttons
		ctrlShow [1224,false];
		ctrlShow [2021,false];
		ctrlShow [2022,false];
	};
};

private _phoneLocations = [//button id, picture id
	[-1,-1]
];
{
	_x params [
		["_appPic","",[""]],
		"",
		["_action",{},[{}]]
	];
	_phoneLocations select _forEachIndex params ["_button","_picture"];

	(_phone displayCtrl _button) buttonSetAction _action;
	(_phone displayCtrl _picture) ctrlSetText _appPic;
} forEach phone_apps;

[
	{
		params [
			["_phone",displayNull,[displayNull]],
			["_handle",-1,[0]]
		];

		if (phone_appOpen isEqualTo -1) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
		if (phone_battery isEqualTo 0) exitWith {
			closeDialog 0;
			[_handle] call CBA_fnc_removePerFrameHandler;
			call DT_fnc_openPhone
		};

		private _batteryPic = call {
			if (phone_battery > 80) exitWith {"\Dom_UI\Phone\base\100bat.paa"};
			if (phone_battery > 60) exitWith {"\Dom_UI\Phone\base\80bat.paa"};
			if (phone_battery > 40) exitWith {"\Dom_UI\Phone\base\60bat.paa"};
			if (phone_battery > 20) exitWith {"\Dom_UI\Phone\base\40bat.paa"};
			if (phone_battery > 10) exitWith {"\Dom_UI\Phone\base\20bat.paa"};
			if (phone_battery > 0) exitWith {"\Dom_UI\Phone\base\10bat.paa"};
		};

		date params ["","","","_hour","_minute"];
		if (_minute >= 0 && _minute <= 9) then {
			_minute = format["0%1",_minute];
		};
		if (_hour >= 0 && _hour <= 9) then {
			_hour = format["0%1",_hour];
		};
		
		(_phone displayCtrl 5525) ctrlSetText (format["%1:%2",_hour,_minute]);
		(_phone displayCtrl 5524) ctrlSetText (format["%1%",phone_battery]);
		(_phone displayCtrl 5523) ctrlSetText _batteryPic;
	},
	1,
	_phone
] call CBA_fnc_addPerFrameHandler;