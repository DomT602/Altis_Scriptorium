/*
	File: fn_recieveKey.sqf
	Author: Dom
	Description: Adds a key to player
*/
params [
	["_vehicle",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
if (isNull _vehicle) exitWith {};

if !(isNull _unit) then {
	private _name = ["Someone",_unit] call DT_fnc_findName;
	[format["%1 has given you keys to a %2.",_name,(getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"))],"green"] call DT_fnc_notify;
};

client_keys pushBackUnique _vehicle;