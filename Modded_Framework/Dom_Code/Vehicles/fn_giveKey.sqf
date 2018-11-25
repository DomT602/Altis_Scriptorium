/*
	File: fn_giveKey.sqf
	Author: Dom
	Description: Gives selected player a key
*/

params [
	["_unit",objNull,[objNull]]
];

if !([_unit] call DT_fnc_checkPlayer) exitWith {};
private _index = lbCurSel 1500;
if (_index isEqualTo -1) exitWith {["You haven't selected a vehicle.","orange"] call DT_fnc_notify};

private _selected = client_keys select _index;

private _keyHolders = _selected getVariable ["key_holders",[]];
_keyHolders pushBackUnique (name _unit);

private _name = ["someone",_unit] call DT_fnc_findName;
[format["You gave %1 keys to your %2.",_name,(getText(configFile >> "CfgVehicles" >> (typeOf _selected) >> "displayName"))],"green"] call DT_fnc_notify;

[_selected,player] remoteExecCall ["DT_fnc_recieveKey",_unit];