/*
	File: fn_spikeVehicle.sqf
	Author: Dom
	Description: Damages the vehicle after hitting a spikestrip
*/
params [
	["_vehicle",objNull,[objNull]]
];

_vehicle setHitPointDamage ["HitLFWheel",1];
_vehicle setHitPointDamage ["HitRFWheel",1];