/*
    File: fn_monitorSpikes.sqf
    Author: Dom
    Description: Monitors the spikestrip till a car hits it or it is picked up
*/
params [
	["_spikes",objNull,[objNull]]
];

private _pos = getPosATL _spikes;
private "_nearVehicles";

waitUntil {
	_nearVehicles = nearestObjects[_pos,["Car"],5]; 
	!(_nearVehicles isEqualTo []) || 
	isNull _spikeStrip
};

if (isNull _spikeStrip) exitWith {};

_nearVehicles params ["_vehicle"];
_vehicle setHitPointDamage["HitLFWheel",1];
_vehicle setHitPointDamage["HitRFWheel",1];
deleteVehicle _spikeStrip;