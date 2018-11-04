/*
	File: fn_spawnVehicle.sqf
	Author: Dom
	Description: Spawns the selected vehicle
*/
params [
	["_pid","",[""]],
	["_vid",-1,[0]],
	["_spawnPoint","",[""]]
];
private _unit = remoteExecutedOwner;
([format["fetchVehicle:%1:%2",_pid,_vid],2] call MySQL_fnc_DBasync) params ["_className","_plate","_colourIndex","_fuel","_damage"];
[format["setVehicleActive:%1:%2",_pid,_plate],1] call MySQL_fnc_DBasync;

private _vehicle = createVehicle [_className,(getMarkerPos _spawnPoint),[],0,"NONE"];
_vehicle setPos (getMarkerPos _spawnPoint);
_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
_vehicle setDir (markerDir _spawnPoint);

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

[_vehicle,_colourIndex] call DT_fnc_setTexture;
_vehicle lock 2;
_vehicle setVariable ["key_holders",[name _unit],true];
_vehicle setVariable ["plate",_plate,true];
[_vehicle] remoteExecCall ["DT_fnc_recieveKey",_unit];
[_pid,_vehicle] call server_fnc_handleKeys;

_vehicle setFuel _fuel;
if !(_damage isEqualTo []) then {
	(getAllHitPointsDamage _vehicle) params ["_parts"];

	for "_i" from 0 to ((count _damage) - 1) do {
		_vehicle setHitPointDamage [format ["%1",(_parts select _i)],_damage select _i];
	};
};