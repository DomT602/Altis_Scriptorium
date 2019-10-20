/*
	File: fn_onRespirator.sqf
	Author: Dom
	Description: Provides the player with repeated air to avoid drowning
*/
params [
	["_unit",objNull,[objNull]]
];

private _name = ["Unknown",_unit] call DT_fnc_findName;

[format["%1 has given you a respirator, this will last 1 minute.",_name],"green"] call DT_fnc_notify;
[
	{
		if (getOxygenRemaining player < 1) then {
			player setOxygenRemaining 1;
		};
		player getVariable ["dead",false]
	},
	{
		true
	},
	0,
	60,
	{
		["You are no longer wearing a respirator."] call DT_fnc_notify
	}
] call CBA_fnc_waitUntilAndExecute;