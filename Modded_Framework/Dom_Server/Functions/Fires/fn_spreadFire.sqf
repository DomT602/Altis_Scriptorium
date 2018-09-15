/*
	File: fn_spreadFire.sqf
	Author: Dom
	Description: Keeps the fire spreading
*/
params [
	["_oldFire",objNull,[objNull]],
	["_oldType","medium",[""]]
];
if (isNull _oldFire) exitWith {};

uiSleep 15;
if (isNull _oldFire) exitWith {};
private _randomArray = selectRandom [["MediumDestructionFire","SmallDestructionSmoke",0.25,[30,3,0,2],[0.4,1,0.1]],["BigDestructionFire","MediumDestructionSmoke",0.3,[50,4,0,2.5],[0.5,2,0.15]],["ObjectDestructionFire1Smallx","BigDestructionSmoke",0.35,[70,5,0,3],[0.6,3,0.2]]];
_randomArray params ["_fireClass","_smokeClass","_brightness","_attenuation","_fireStats"];
getPosATL _oldFire params ["_xCoord","_yCoord"];
for "_i" from 0 to (round(random 4)) step 1 do {
	private _distance = 10;
	private _position = [(_xCoord + (round(random [-_distance,0,_distance]))), (_yCoord + (round(random [-_distance,0,_distance]))),0];
	private _extraFire = "#particlesource" createVehicle _position;
	_extraFire setParticleClass _fireClass;
	_extraFire setPosATL _position;
	_extraFire setParticleFire _fireStats;

	private _smoke = "#particlesource" createVehicle _position;
	_smoke setParticleClass _smokeClass;
	_smoke setPosATL _position;

	private _light = "#lightpoint" createVehicle _position;
	_light setPosATL _position;
	_light setLightBrightness _brightness;
	_light setLightAmbient [1,0.5,0];
	_light setLightColor [1,0.45,0];
	_light setLightAttenuation _attenuation;
	//_light setLightDayLight true;
	if ((round random 10) isEqualTo 1) then {
        private _charge = "DemoCharge_Remote_Ammo_Scripted" createVehicle _position;
        _charge setDamage 1
    };
    [_extraFire] spawn server_fnc_spreadFire;
};