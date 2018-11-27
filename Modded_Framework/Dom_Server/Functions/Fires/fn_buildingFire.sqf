/*
	File: fn_buildingFire.sqf
	Author: Dom
	Description: Extinguishes the fire
*/
params [
    ["_building",objNull,[objNull]]
];
if (isNull _building) exitWith {};

private _positions = _building buildingPos -1;
private _fires = [];
//need fire alarm
{
    private _randomArray = selectRandom [["MediumDestructionFire","SmallDestructionSmoke",0.25,[30,3,0,2],[0.4,1,0.1]],["BigDestructionFire","MediumDestructionSmoke",0.3,[50,4,0,2.5],[0.5,2,0.15]],["ObjectDestructionFire1Smallx","BigDestructionSmoke",0.35,[70,5,0,3],[0.6,3,0.2]]];
    _randomArray params ["_fireClass","_smokeClass","_brightness","_attenuation","_fireStats"];

    private _fire = "#particlesource" createVehicle _x;
    _fire setParticleClass _fireClass;
    _fire setPosATL _x;
    _fire setParticleFire _fireStats;

    private _smoke = "#particlesource" createVehicle _x;
    _smoke setParticleClass _smokeClass;
    _smoke setPosATL _x;

    private _light = "#lightpoint" createVehicle _x;
    _light setPosATL _x;
    _light setLightBrightness _brightness;
    _light setLightAmbient [1,0.5,0];
    _light setLightColor [1,0.45,0];
    _light setLightAttenuation _attenuation;

    _fires pushBack _fire;
    _fires pushBack _smoke;
    _fires pushBack _light;
    _building setVariable ["fire_count",(_building getVariable ["fire_count",0]) + 1,true];
} forEach _positions;

private _fireTime = time;
waitUntil {(_building getVariable ["fire_count",0] isEqualTo 0) || ((time - _fireTime) > 15)};
if (_building getVariable ["fire_count",0] isEqualTo 0) exitWith {_building setVariable ["fire_count",nil,true]};

private _coords = getPosATL _building;
private _nearestBuildings = nearestObjects [_building, ["House", "Building"], 20];
_nearestBuildings = _nearestBuildings - [_building];
_nearestBuildings params ["_nearBuilding"];

if (_building distance _nearBuilding < 15) then {
    [_nearBuilding] spawn server_fnc_buildingFire
};

{
    deleteVehicle _x
} forEach _fires;

private _furniture = _building getVariable ["furniture",[]];
{
    _x hideObjectGlobal true;
} forEach _furniture; //just hide furniture till restart
_building setDamage 1;

_building setVariable ["fire_count",nil,true];
[_coords,"small"] spawn server_fnc_createFire;