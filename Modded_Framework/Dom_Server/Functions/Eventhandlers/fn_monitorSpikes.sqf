/*
    File: fn_monitorSpikes.sqf
    Author: Dom
    Description: Monitors the spikestrip till a car hits it or it is picked up
*/
params [
	["_spikes",objNull,[objNull]]
];

private _pos = getPosATL _spikes;
private "_nearVehicle";

waitUntil {
	_nearVehicle = nearestObjects[_pos,["Car"],5] param [0,objNull,[objNull]]; 
	!(isNull _nearVehicle) || 
	isNull _spikeStrip
};

if (isNull _spikeStrip) exitWith {};

_nearVehicle setHitPointDamage["HitLFWheel",1];
_nearVehicle setHitPointDamage["HitRFWheel",1];
deleteVehicle _spikeStrip;