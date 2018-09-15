/*
	File: fn_lockSwitch.sqf
	Author: Dom
	Description: Switches the state of the vehicles lock
*/
private _vehicle = vehicle player;
if (isNull objectParent player) then {
    _vehicle = cursorObject
};

if (isNull _vehicle) exitWith {};

if (_vehicle isKindOf "House_F") exitWith {
	if (_vehicle in client_keys) then {
        private _door = 0;
		private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "numberOfDoors");
		for "_i" from 1 to _doors do {
		    private _selectionPos = _vehicle selectionPosition format ["Door_%1_trigger",_i];
		    private _worldSpace = _vehicle modelToWorld _selectionPos;
		    if (player distance _worldSpace < 2) exitWith {_door = _i};
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

if (_vehicle in client_keys && {player distance _vehicle < 10}) then {
	private _locked = locked _vehicle;
	if (_locked isEqualTo -1) exitWith {};
	if (_locked isEqualTo 0) then {
		_vehicle say3D ["lock",50,1];
		_vehicle lock 2;
	} else {
		_vehicle say3D ["unlock",50,1];
		_vehicle lock 0;
	};
};
true;