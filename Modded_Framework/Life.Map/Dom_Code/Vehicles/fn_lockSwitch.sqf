/*
	File: fn_lockSwitch.sqf
	Author: Dom
	Description: Switches the state of the vehicles lock
*/
private _vehicle = if (isNull objectParent player) then {
	cursorObject
} else {
	vehicle player
};
if (isNull _vehicle) exitWith {};

if (_vehicle isKindOf "House_F") exitWith {
	if (_vehicle in client_keys || (((_vehicle getVariable ["houseKeys",[]]) findIf {getPlayerUID player isEqualTo (_x select 0)}) != -1)) then {
		private _door = 0;
		private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "numberOfDoors");
		for "_i" from 1 to _doors do {
			private _pos = _vehicle modeltoWorld (_vehicle selectionPosition format["Door_%1_trigger",_i]);
			if (player distance _pos < 1.75) exitWith {_door = _i};
		};
		if (_door isEqualTo 0) exitWith {};
		private _locked = _vehicle getVariable [format ["bis_disabled_Door_%1",_door],0];

		if (_locked isEqualTo 0) then {
			_vehicle setVariable [format ["bis_disabled_Door_%1",_door],1,true];
			["Door locked."] call DT_fnc_notify;
		} else {
			_vehicle setVariable [format ["bis_disabled_Door_%1",_door],0,true];
			["Door unlocked."] call DT_fnc_notify;
		};
	};
	true;
};

if (_vehicle in client_keys && ([_vehicle,10] call DT_fnc_checkVehicle)) then {
	private _locked = locked _vehicle;
	if (_locked isEqualTo -1) exitWith {};
	_locked = if (_locked isEqualTo 0) then {2} else {0};
	[_vehicle,["unlock",50,1]] remoteExecCall ["say3D",-2];
	[_vehicle,_locked] remoteExecCall ["lock",_vehicle];
};
true;
