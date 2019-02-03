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
					if (!_spread && {(CBA_missionTime - _time) > 20}) exitWith {
						[_fire] call server_fnc_spreadFire;
						(server_fires select _forEachIndex) set [1,true];
					};
					//if ((CBA_missionTime - _time) > 900) exitWith {
					//	[getPosATL _fire,100] call server_fnc_extinguishFire;
					//};
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