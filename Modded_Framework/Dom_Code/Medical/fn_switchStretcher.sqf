/*
	File: fn_switchStretcher.sqf
	Author: Dom
	Description: Loads or unloads the stretcher
*/
params [
	["_ambulance",objNull,[objNull]]
];

private _stretcher = _ambulance getVariable ["stretcher",objNull];

if (isNull _stretcher) then {
	_ambulance animate ["Addon_1",1];
	(nearestObjects [_ambulance,["stretcher"],6]) params ["_stretcher"];
	_stretcher attachTo [_ambulance, [-0.14,-1.8,1.1]];
	_stretcher setDir 180; 
	_ambulance setVariable ["stretcher",_stretcher,true];
} else {
	detach _stretcher;
	_stretcher setPosATL (_ambulance modelToWorld [0,-5,-0.1]);
	_ambulance setVariable ["stretcher",objNull,true];
	_ambulance animate ["Addon_1",0];
};