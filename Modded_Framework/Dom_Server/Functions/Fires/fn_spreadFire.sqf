/*
	File: fn_spreadFire.sqf
	Author: Dom
	Description: Keeps the fire spreading
*/
params [
	["_oldFire",objNull,[objNull]],
	["_oldType","medium",[""]]
];
if (count server_fires > 99) exitWith {diag_log format["Max fires reached at: %1.",CBA_missionTime]};

private _origin = getPosATL _oldFire;
private _surface = surfaceType _origin;
if (_surface == "ag_seabed" || surfaceIsWater _origin) exitWith {};

private _chance = switch _surface do {
	case "#ag_grass": {80};	
	case "#ag_sand": {50};
	case "#ag_rock": {25};
	case "#ag_concrete": {10};
	case "#ag_pebbles": {50};
	case "#ag_racing": {10};
	case "#ag_farm": {90};
	default {50};
};

if ((round random 100) < _chance) then {
	private _randomArray = selectRandom [["MediumDestructionFire","SmallDestructionSmoke",0.25,[30,3,0,2],[0.4,1,0.1]],["BigDestructionFire","MediumDestructionSmoke",0.3,[50,4,0,2.5],[0.5,2,0.15]],["ObjectDestructionFire1Smallx","BigDestructionSmoke",0.35,[70,5,0,3],[0.6,3,0.2]]];
	_randomArray params ["_fireClass","_smokeClass","_brightness","_attenuation","_fireStats"];
	for "_i" from 0 to (round(random 4)) do {
		private _position = _origin getPos [10 * (1 - abs random [-1, 0, 1]),random 360];
		private _extraFire = createVehicle ["#particlesource",_position,[],0,"CAN_COLLIDE"];
		_extraFire setParticleClass _fireClass;
		_extraFire setParticleFire _fireStats;

		private _smoke = createVehicle ["#particlesource",_position,[],0,"CAN_COLLIDE"];
		_smoke setParticleClass _smokeClass;

		private _light = createVehicle ["#lightpoint",_position,[],0,"CAN_COLLIDE"];
		[_light,_brightness,_attenuation] remoteExecCall ["DT_fnc_setLightParams",-2];
		if (_oldType != "small" && {(round random 25) isEqualTo 1}) then {
			private _charge = createVehicle ["DemoCharge_Remote_Ammo_Scripted",_position,[],0,"CAN_COLLIDE"];
			_charge setDamage 1;
		};
		server_fires pushBack [_extraFire,false,CBA_missionTime];
	};
};