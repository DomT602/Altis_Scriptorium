/*
	File: fn_checkVehicle.sqf
	Author: Dom
	Description: Series of checks to see if a target is valid if !([_vehicle,5] call DT_fnc_checkVehicle) exitWith {};
*/
params [
	["_vehicle",objNull,[objNull]],
	["_distance",-1,[0]]
];

if (isNull _vehicle) exitWith {["No target.","red"] call DT_fnc_notify; false};
if !(alive _vehicle) exitWith {["Invalid target.","red"] call DT_fnc_notify; false};
if !(_distance isEqualTo -1) exitWith {
	if (player distance _vehicle > _distance) exitWith {
		["Target is too far away.","red"] call DT_fnc_notify;
		false
	};
	true
};
true