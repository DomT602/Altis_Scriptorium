/*
	File: fn_plantSeed.sqf
	Author: Dom
	Description: Sends request to server to plant the seed
*/

if (client_blockActions || !(isNull objectParent player)) exitWith {};
if !(active_seed in (magazines player)) exitWith {["You have none of your selected seed.","orange"] call DT_fnc_notify};

private _nearPlants = nearestObjects [player,["Plant_1","Plant_2"],3];
if !(_nearPlants isEqualTo []) exitWith {["You can't plant so close to another plant.","orange"] call DT_fnc_notify};

private _plantName = switch active_seed do {
	case "Wheat_seed_i": {"wheat"};
};

player playMoveNow "DT_farming";
[format["You planted some %1.",_plantName],"green"] call DT_fnc_notify;
player removeItem active_seed;
[getPosASL player,active_seed] remoteExecCall ["server_fnc_plantSeed",2];
