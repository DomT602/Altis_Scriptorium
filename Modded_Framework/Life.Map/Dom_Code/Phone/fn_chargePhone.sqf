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
			private _HUD = uiNamespace getVariable ["DT_HUD",displayNull];

			if (!phone_charging || _battery isEqualTo 100) exitWith {
				(_HUD displayCtrl 1512) ctrlSetStructuredText parseText "";
				[_this select 1] call CBA_fnc_removePerFrameHandler;
				if (_battery isEqualTo 100) then {
					phone_charging = false;
					["Your phone is now fully charged.","green"] call DT_fnc_notify;
				};
			};
			
			private _newCharge = _battery + 1;
			player setVariable ["phoneBattery",_newCharge,[clientOwner,2]];
			(_HUD displayCtrl 1512) ctrlSetStructuredText parseText format["[%1%2] Charging phone",_newCharge,"%"];
		},
		15
	] call CBA_fnc_addPerFrameHandler;
};
true;