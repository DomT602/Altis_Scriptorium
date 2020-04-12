/*
	File: fn_switchLockHouse.sqf
	Author: Dom
	Description: Switches lock state of entire house - both furniture and doors
*/
params [
	["_house",objNull,[objNull]]
];
if (isNull _house) exitWith {};

private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
if (_house getVariable ["locked",true]) then {
	_house setVariable ["locked",false,true];
	["Building unlocked."] call DT_fnc_notify;
	for "_i" from 1 to _doors do {
		_house setVariable [format ["bis_disabled_Door_%1",_i],0,true];
	};
} else {
	for "_i" from 1 to _doors do {
		_house setVariable [format ["bis_disabled_Door_%1",_i],1,true];
	};
	_house setVariable ["locked",true,true];
	["Building locked."] call DT_fnc_notify;
};