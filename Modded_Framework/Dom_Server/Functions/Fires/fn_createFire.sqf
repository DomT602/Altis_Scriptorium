/*
	File: fn_createFire.sqf
	Author: Dom
	Description: Creates fire at given position
*/
params [
	["_position",[],[[]]],
	["_type","large",[""]]
];
if (_position isEqualTo []) exitWith {};

(switch _type do {
    case "small": {
        ["MediumDestructionFire","SmallDestructionSmoke",0.25,[30,3,0,2],[0.4,1,0.1],"small"];
    };
    case "medium": {
        ["BigDestructionFire","MediumDestructionSmoke",0.3,[50,4,0,2.5],[0.5,2,0.15],"small"];
    };
    case "large": {
        ["ObjectDestructionFire1Smallx","BigDestructionSmoke",0.35,[70,5,0,3],[0.6,3,0.2],"medium"];
    };
}) params ["_fireClass","_smokeClass","_brightness","_attenuation","_fireStats","_spreadFire"];

private _fire = "#particlesource" createVehicle _position;
_fire setParticleClass _fireClass;
_fire setPosATL _position;
_fire setParticleFire _fireStats;

private _smoke = "#particlesource" createVehicle _position;
_smoke setParticleClass _smokeClass;
_smoke setPosATL _position;

private _light = "#lightpoint" createVehicle _position;
_light setPosATL _position;
_light setLightBrightness _brightness; //1 is the same as _light setLightIntensity 3000;
_light setLightAmbient [1,0.5,0];
_light setLightColor [1,0.45,0];
_light setLightAttenuation _attenuation;
//_light setLightDayLight true;

[_fire,"medium"] spawn server_fnc_spreadFire;