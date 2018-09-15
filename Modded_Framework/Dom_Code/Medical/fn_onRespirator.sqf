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
for "_i" from 1 to 12 step 1 do {
	player setOxygenRemaining 1;
	uiSleep 5;
};