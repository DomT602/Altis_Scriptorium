/*
	File: fn_plantSeed.sqf
	Author: Dom
	Description: Sends request to server to plant the seed
*/

if !(isNull objectParent player) exitWith {};
if (client_blockActions) exitWith {};
if !(active_seed in (magazines player)) exitWith {["You have none of your selected seed.","orange"] call DT_fnc_notify};

private _nearPlants = nearestObjects [player,["Plant_1","Plant_2"],3];
if !(_nearPlants isEqualTo []) exitWith {["You can't plant so close to another plant.","orange"] call DT_fnc_notify};

private _plantName = switch (active_seed) do {
    case "Wheat_seed_i": {"wheat"};
};

player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
[format["You planted some %1.",_plantName],"green"] call DT_fnc_notify;
[getPosATL player,active_seed] remoteExec ["server_fnc_plantSeed",2];
