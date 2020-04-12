/*
	File: fn_chargePhone.sqf
	Author: Dom
	Description: Charges a phone
*/
if ((player getVariable ["phoneBattery",100]) isEqualTo 100) exitWith {["Your phone is already fully charged.","blue"] call DT_fnc_notify};
if (isNull objectParent player) exitWith {["You must be in a vehicle to charge your phone.","orange"] call DT_fnc_notify};

if (phone_charging) then {
	phone_charging = false;
} else {
	phone_charging = true;
	[
		{
			private _battery = player getVariable ["phoneBattery",100];
			if (!phone_charging || _battery isEqualTo 100) exitWith {
				[_this select 1] call CBA_fnc_removePerFrameHandler;
				if (_battery isEqualTo 100) then {
					phone_charging = false;
					["Your phone is now fully charged.","green"] call DT_fnc_notify;
				};
			};
			player setVariable ["phoneBattery",_battery + 1,[clientOwner,2]];
		},
		15
	] call CBA_fnc_addPerFrameHandler;
};
true;