/*
	File: fn_harvestPlant.sqf
	Author: Dom
	Description: Harvests the plant or informs user of its growth
*/
params [
	["_plant",objNull,[objNull]]
];

if (client_blockActions || !(isNull objectParent player)) exitWith {};

(switch (typeOf _plant) do {
	case "Wheat_vehicle": {["wheat",false,"Wheat_i"]};
	case "Oleander2": {["opium",true,"Opium_i"]};
	case "Ficus_Bush_1": {["olive",false,"Olive_i"]};
}) params ["_name","_illegal","_class"];

if (player getVariable ["faction","civ"] isEqualTo "cop" && _illegal) exitWith {
	player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil {animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"};
	[format["You received $500 for destroying the %1 plant.",_name],"green"] call DT_fnc_notify;
	["cash",500] call DT_fnc_handleMoney;
	deleteVehicle _plant;
};
private _growthPercent = _plant getVariable ["growthPercent",0];
if (_growthPercent isEqualTo 100) then {
	private _level = player getVariable ["level_farming",0];
	if ((_level < 5 && (round(random(100)) < 40)) || {_level < 10 && (round(random(100)) < 20)}) exitWith {
		["You failed to harvest the plant!","red"] call DT_fnc_notify;
		["farming",1] call DT_fnc_addExp;
		deleteVehicle _plant;
		};
	
	private _count = if (surfaceType (getPosATL player) == "#crystal_lake_farm") then {2} else {1};
	_count = _count + round((player getVariable ["level_farming",0]) / 10);
	if (player canAdd [_class,_count]) then {
		player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil {animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"};
		deleteVehicle _plant;
		for "_i" from 1 to _count do {
			player addItem _class;
		};
		[format["You harvested %2 units of %1.",_name,_count],"green"] call DT_fnc_notify;
		["farming",2] call DT_fnc_addExp;
	} else {
		["Your inventory is full.","orange"] call DT_fnc_notify;
	};
} else {
	[(call {
		if (_growthPercent < 10) exitWith {"Only just planted."};
		if (_growthPercent < 30) exitWith {"Just started growing."};
		if (_growthPercent < 50) exitWith {"Almost half grown."};
		if (_growthPercent < 70) exitWith {"Just over halfway grown."};
		if (_growthPercent < 100) exitWith {"Almost fully grown."};
	})] call DT_fnc_notify;
};