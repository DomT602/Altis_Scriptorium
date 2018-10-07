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
diag_log "storing vehicle";
([format["fetchVehicle:%1:%2",_pid,_vid],2] call MySQL_fnc_DBasync) params ["_className","_plate","_colourIndex","_fuel","_damage"];
[format["setVehicleActive:%1:%2",_pid,_plate],1] call MySQL_fnc_DBasync;

private _vehicle = createVehicle [_className,(getMarkerPos _spawnPoint),[],0,"NONE"];
diag_log "vehicle made";
[
	{
		!isNull (_this select 0)
	},
	{
		params [
			["_vehicle",objNull,[objNull]],
			["_spawnPoint","",[""]],
			["_colourIndex",-1,[0]],
			["_pid","",[""]],
			["_unit",objNull,[objNull]],
			["_plate","",[""]],
			["_fuel",0,[0]],
			["_damage",[],[[]]]
		];
		_vehicle allowDamage false;
		_vehicle setDir (markerDir _spawnPoint);
		_vehicle setPos (getMarkerPos _spawnPoint);
		_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
		_vehicle allowDamage true;

		[_pid,_vehicle] call server_fnc_handleKeys;
		[_vehicle] remoteExecCall ["DT_fnc_recieveKey",_unit];
		_vehicle lock 2;

		_vehicle setVariable ["key_holders",[name _unit],true];
		_vehicle setVariable ["plate",_plate,true];
		[_vehicle,_colourIndex] remoteExecCall ["DT_fnc_setTexture",_unit];

		_vehicle setFuel _fuel;
		if !(_damage isEqualTo []) then {
			(getAllHitPointsDamage _vehicle) params ["_parts"];

			for "_i" from 0 to ((count _damage) - 1) do {
				_vehicle setHitPointDamage [format ["%1",(_parts select _i)],_damage select _i];
			};
		};
	},
	[_vehicle,_spawnPoint,_colourIndex,_pid,remoteExecutedOwner,_plate,_fuel,_damage]
] call CBA_fnc_waitUntilAndExecute;