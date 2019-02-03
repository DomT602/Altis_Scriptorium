/*
	File: fn_harvestAnimal.sqf
	Author: Dom
	Description: Harvests the animal for meat
*/
params [
	["_animal",objNull,[objNull]]
];

if (isNull _animal || client_blockActions || !(isNull objectParent player)) exitWith {};

private _time = switch (typeOf _animal) do {
	case "Hen_random_F": {4};
	case "Cock_random_F": {3};
	case "Rabbit_F": {5};
	case "Goat_random_F": {7.5};
	case "Sheep_random_F": {7.5};
	default {1};
};

["Gutting",_time,"AinvPknlMstpSnonWnonDnon_medic_1","isNull objectParent player && player distance MB_Interaction_Target < 5 && !(isNull MB_Interaction_Target)",
{
	["Gutting finished.","green"] call DT_fnc_notify;
	private _item = switch (typeOf MB_Interaction_Target) do {
		case "Hen_random_F": {"Meat_Type_1"};
		case "Cock_random_F": {};
		case "Rabbit_F": {};
		case "Goat_random_F": {};
		case "Sheep_random_F": {};
		default {""};
	};
	if (MB_Interaction_Target getVariable ["quality",false]) then {
		_item = format["%1_Quality",_item];
	};
	[player,""] remoteExecCall ["switchMove",-2];
	if (_item isEqualTo "") exitWith {};
	deleteVehicle MB_Interaction_Target;
	["hunting",1] call DT_fnc_addExp;
	remoteExecCall ["server_fnc_spawnAnimal",2];
	private _amount = 1 + round(floor(random 10) * ((player getVariable ["level_hunting",1]) / 100));
	for "_i" from 0 to _amount do {
		if !(player canAdd _item) exitWith {["Your inventory is full.","orange"] call DT_fnc_notify};
		player addItem _item;
	};
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Gutting cancelled."};
		case 2: {"You are dead."};
		case 3: {"Gutting failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;