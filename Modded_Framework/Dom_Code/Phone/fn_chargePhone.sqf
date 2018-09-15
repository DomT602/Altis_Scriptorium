/*
    File: fn_chargePhone.sqf
    Author: Dom
    Description: Charges a phone
*/

if (phone_charging) then {
	phone_charging = false;
} else {
	phone_charging = true;
	[
		{
			if (!phone_charging || phone_battery isEqualTo 100) exitWith {
				[_this select 1] call CBA_fnc_removePerFrameHandler;
			};
			phone_battery = phone_battery + 1;
		},
		15
	] call CBA_fnc_addPerFrameHandler;
};