/*
	File: fn_catchFish.sqf
	Author: Dom
	Description: Catches an aquatic animal
*/
params [
	["_animal",objNull,[objNull]]
];
if (player distance _animal > 4) exitWith {["Aquatic animal is too far away.","orange"] call DT_fnc_notify};

private _animalType = typeOf _animal;
(switch _animalType do {
	case "Salema_F": {["Fishy_Raw_Name","Fishy_Name"]};
	case "Ornate_random_F": {["Fishy_Raw_Name","Fishy_Name"]};
	case "Mackerel_F": {["Fishy_Raw_Name","Fishy_Name"]};
	case "Tuna_F": {["Fishy_Raw_Name","Fishy_Name"]};
	case "Mullet_F": {["Fishy_Raw_Name","Fishy_Name"]};
	case "CatShark_F": {["Fishy_Raw_Name","Fishy_Name"]};
	case "Turtle_F": {["Fishy_Raw_Name","Fishy_Name"]};
}) params ["_className","_name"];

if !(player canAdd _className) exitWith {["You don't have enough space in your inventory.","orange"] call DT_fnc_notify};
deleteVehicle _animal;
player addItem _className;
[format["You caught a %1.",_name],"green"] call DT_fnc_notify;