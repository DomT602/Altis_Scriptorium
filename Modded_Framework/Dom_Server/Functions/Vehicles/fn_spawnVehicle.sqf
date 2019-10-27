/*
	File: fn_spawnVehicle.sqf
	Author: Dom
	Description: Spawns the selected vehicle
*/
params [
	["_pid","",[""]],
	["_plate","",[""]],
	["_spawnPoint","",[""]],
	["_name","",[""]]
];

([format["fetchVehicle:%1",_plate],2] call MySQL_fnc_DBasync) params ["_className","_customisation","_fuel","_damage"];
_customisation params ["_colour"];

private _vehicle = createVehicle [_className,getMarkerPos _spawnPoint,[],0];
if (isNull _vehicle) exitWith {["Vehicle failed to spawn."] remoteExecCall ["DT_fnc_notify",remoteExecutedOwner]};
[format["setVehicleActive:%1",_plate],1] call MySQL_fnc_DBasync;
_vehicle setDir (markerDir _spawnPoint);

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

if (_vehicle isKindOf "Car") then {
	[_vehicle,_customisation] call DT_fnc_setCustomisation;
} else {
	[_vehicle,_customisation,false,0] call DT_fnc_setCustomisation;
};

_vehicle lock 2;
_vehicle setVariable ["keyHolders",[_name],true];
_vehicle setVariable ["plate",_plate,true];
_vehicle setPlateNumber _plate;
[_vehicle] remoteExecCall ["DT_fnc_recieveKey",remoteExecutedOwner];
[_pid,_vehicle] call server_fnc_handleKeys;

_vehicle setFuel _fuel;
if !(_damage isEqualTo []) then {
	(getAllHitPointsDamage _vehicle) params ["_parts"];

	{
		_vehicle setHitPointDamage [_x,_damage select _forEachIndex];
	} forEach _parts;
};