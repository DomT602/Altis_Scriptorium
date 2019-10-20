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
if (surfaceType _position == "#ag_seabed" || surfaceIsWater _position) exitWith {};

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

private _fire = createVehicle ["#particlesource",_position,[],0,"CAN_COLLIDE"];
_fire setParticleClass _fireClass;
_fire setParticleFire _fireStats;

private _smoke = createVehicle ["#particlesource",_position,[],0,"CAN_COLLIDE"];
_smoke setParticleClass _smokeClass;

private _light = createVehicle ["#lightpoint",_position,[],0,"CAN_COLLIDE"];
[_light,_brightness,_attenuation] remoteExecCall ["DT_fnc_setLightParams",-2];

server_fires pushBack [_fire,false,CBA_missionTime];

if (fire_handle isEqualTo -1) then {
	fire_handle = [
		{
			if (server_fires isEqualTo []) exitWith {
				[_this select 1] call CBA_fnc_removePerFrameHandler;
				fire_handle = -1;
			};
			private _toDelete = [];
			{
				_x params ["_fire","_spread","_time"];
				if (isNull _fire) then {
					_toDelete pushBack _forEachIndex;
				} else {
					if (!_spread && {(CBA_missionTime - _time) > 30}) exitWith {
						[_fire] call server_fnc_spreadFire;
						(server_fires select _forEachIndex) set [1,true];
					};
					if ((CBA_missionTime - _time) > 900 && {playableUnits findIf {_x distance (getPosATL _fire) < 100} isEqualTo -1}) exitWith {
						[getPosATL _fire,100] call DT_fnc_extinguishFire;
					};
				};
			} forEach server_fires;
			reverse _toDelete;
			{
				server_fires deleteAt _x;
			} forEach _toDelete;
		},
		1
	] call CBA_fnc_addPerFrameHandler;
};