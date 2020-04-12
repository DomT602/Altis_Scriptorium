/*
	File: fn_extinguishFire.sqf
	Author: Dom
	Description: Extinguishes the fire
*/
params [
	["_position",[],[[]]],
	["_distance",1.5,[0]]
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
				private _fires = _nearBuilding getVariable ["fireCount",0];
				if (_fires > 0) then {
					_nearBuilding setVariable ["fireCount",(_fires - 1),true]
				};
			};
		};
	};
} forEach _stuff;