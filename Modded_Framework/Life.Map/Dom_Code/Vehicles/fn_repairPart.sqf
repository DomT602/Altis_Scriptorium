/*
	File: fn_repairMenu.sqf
	Author: Dom
	Description: Opens and populates the repair menu for cars
*/

params [
	["_part","",[""]]
];

(switch _part do {
	case "hull": {["D_scrapMetal",["HitBody","HitHull","HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6"]]};
	case "engine": {["D_engineParts","HitEngine"]};
	case "fuelTank": {["D_fuelTankParts","HitFuel"]};
	case "LFwheel": {["D_spareWheel","HitLFWheel"]};
	case "LBwheel": {["D_spareWheel","HitLF2Wheel"]};
	case "RFwheel": {["D_spareWheel","HitRFWheel"]};
	case "RBwheel": {["D_spareWheel","HitRF2Wheel"]};
}) params ["_item","_part"];

if !(_item in (items player)) exitWith {["You don't have the required item.","orange"] call DT_fnc_notify};

["Repairing",10,"Acts_carFixingWheel","isNull objectParent player && ([MB_Interaction_Target,5] call DT_fnc_checkVehicle)",
{
	params [
		["_item","",[""]],
		["_part","",["",[]]]
	];
	player removeItem _item;
	["Repairing finished.","green"] call DT_fnc_notify;
	if (_part isEqualType []) then {
		{
			MB_Interaction_Target setHitPointDamage [_x,0];
		} forEach _part;
	} else {
		MB_Interaction_Target setHitPointDamage [_part,0];
	};
	[player,""] remoteExecCall ["switchMove",-2];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Repairing cancelled."};
		case 2: {"You are dead."};
		case 3: {"Repairing failed."};
	}),"orange"] call DT_fnc_notify;
},
[_item,_part]] call DT_fnc_progressBar;