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

([format["fetchVehicle:%1:%2",_pid,_plate],2] call MySQL_fnc_DBasync) params ["_className","_customisation","_fuel","_damage"];
[format["setVehicleActive:%1:%2",_pid,_plate],1] call MySQL_fnc_DBasync;
_customisation params ["_colour"];

private _pos = getMarkerPos _spawnPoint;
private _vehicle = createVehicle [_className,_pos,[],0,"NONE"];
_vehicle setPos _pos;
_vehicle setVectorUp (surfaceNormal _pos);
_vehicle setDir (markerDir _spawnPoint);

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

[_vehicle,_colour] call DT_fnc_setTexture;
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
["Your vehicle is ready.","green"] remoteExecCall ["DT_fnc_notify",remoteExecutedOwner];