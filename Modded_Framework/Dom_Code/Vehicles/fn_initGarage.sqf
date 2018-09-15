/*
    File: fn_openGarage.sqf
    Author: Dom
    Description: Opens the players garage
*/
params [
    ["_data",[],[[]]]
];

_data params [
	["_impounded",false,[false]],
	["_type","Car",[""]],
	["_spawns",[],[[]]]
];

createDialog "DT_garage";
disableSerialization;

uiNamespace setVariable ["Impound_Lot",_impounded];
uiNamespace setVariable ["Garage_Spawns",_spawns];

[getPlayerUID player,player getVariable ["faction","civ"],_type,_impounded] remoteExecCall ["DB_fnc_fetchGarage",2];