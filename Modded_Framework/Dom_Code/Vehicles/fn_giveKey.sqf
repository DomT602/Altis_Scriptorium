/*
	File: fn_giveKey.sqf
	Author: Dom
	Description: Gives selected player a key
*/

if ((lbCurSel 2501) isEqualTo -1) exitWith {["No vehicle selected."] call DT_fnc_notify};
private _ID = lbValue[2501,(lbCurSel 2501)];
if ((lbCurSel 2506) isEqualTo -1) exitWith {["No person selected."] call DT_fnc_notify};
private _unit = lbData[2506,(lbCurSel 2506)];
_unit = call compile format ["%1", _unit];
if (isNull _unit || isNil "_unit") exitWith {};

private _selected = client_keys select _ID;

private _keyHolders = _selected getVariable ["key_holders",[]];
if !((name _unit) in _keyHolders) then {
	_keyHolders pushBack (name _unit);
};

private _name = ["someone",_unit] call DT_fnc_findName;

[format["You gave %1 keys to your %2.",_name,(getText(configFile >> "CfgVehicles" >> (typeOf _selected) >> "displayName"))],"green"] call DT_fnc_notify;

[_selected,player] remoteExecCall ["DT_fnc_recieveKey",_unit];