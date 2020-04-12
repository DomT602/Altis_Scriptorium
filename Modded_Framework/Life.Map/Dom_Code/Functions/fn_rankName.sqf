/*
	File: fn_rankName.sqf
	Author: Dom
	Description: Changes a rank (NUMBER) to a named rank (STRING)
*/
params [
	["_faction","cop",[""]],
	["_rank",0,[0]],
	["_department",0,[0]]
];

if (_faction isEqualTo "cop") exitWith {
	private _ranks = call {
		if (_department in [0,2]) exitWith {["Cadet","Officer","Corporal","Sergeant","Lieutenant","Captain","Chief"]};
		if (_department isEqualTo 1) exitWith {["Cadet","Officer","Corporal","Sergeant","Lieutenant","Warden","Chief"]};
		if (_department isEqualTo 3) exitWith {["Probationary Operator","Operator","Specialist","Sergeant","Lieutenant","Captain","Chief"]};
		["Probationary Detective","Detective","Senior Detective","Detective Sergeant","Lieutenant","Captain","Chief"];
	};
	(_ranks select (_rank - 1))
};

if (_faction isEqualTo "medic") exitWith {
	private _ranks = call {
		if (_department isEqualTo 0) exitWith {["Probationary EMT","BLS Paramedic","ALS Paramedic","Doctor","Lieutenant","Captain","Chief"]};
		if (_department isEqualTo 1) exitWith {["Probationary Coastie","Seaman","Pilot","Flight Medic","Lieutenant","Captain","Chief"]};
		["Probationary Firefighter","Firefighter","Senior Firefighter","Engineer","Lieutenant","Captain","Chief"];
	};
	(_ranks select (_rank - 1))
};

private _ranks = ["Civilian","State Prosecutor","District Attorney","Judge","Justice","Chief Justice"];
(_ranks select _rank)