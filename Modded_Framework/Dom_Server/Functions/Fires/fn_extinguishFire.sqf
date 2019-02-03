/*
	File: fn_extinguishFire.sqf
	Author: Dom
	Description: Extinguishes the fire
*/
params [
    ["_position",[],[[]]],
    ["_distance",2,[0]]
];
if (_position isEqualTo []) exitWith {};

private _stuff = nearestObjects [_position,[],_distance];
private _nearBuilding = nearestBuilding _position;
{
    if (typeOf _x isEqualTo "#particlesource") then {
        deleteVehicle _x
    } else {
        if (typeOf _x isEqualTo "#lightpoint") then {
            deleteVehicle _x;
            if (_nearBuilding distance _position < 5) then {
                private _fires = _nearBuilding getVariable ["fire_count",0];
                if (_fires > 0) then {
                    _nearBuilding setVariable ["fire_count",(_fires - 1),false]
                };
            };
        };
    };
} forEach _stuff;