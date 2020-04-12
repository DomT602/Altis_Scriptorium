/*
	File: fn_changeRank.sqf
	Author: Dom
	Description: Takes data from menu and sends request to server to update targets rank/department
*/
params [
	["_type",true,[true]]
];

private _faction = player getVariable ["faction","civ"];
if (_type) then {
	private _selectionPath = if (_faction isEqualTo "cop") then {tvCurSel 1500} else {tvCurSel 9201};
	if (count _selectionPath < 2) exitWith {["You need to select something.","orange"] call DT_fnc_notify};
	_selectionPath params ["_department","_rank"];

	_rank = _rank + 1;
	closeDialog 0;

	switch _faction do {
		case "cop": {
			MB_Interaction_Target setVariable ["copRank",_rank,true];
			MB_Interaction_Target setVariable ["department",(switch _department do {
				case 0: {"Patrol"};
				case 1: {"Department of Corrections"};
				case 2: {"Highway Patrol"};
				case 3: {"SWAT"};
				case 4: {"DTU"};
			}),true];
		};
		case "medic": {
			MB_Interaction_Target setVariable ["medicRank",_rank,true];
			MB_Interaction_Target setVariable ["department",(switch _department do {
				case 0: {"EMS"};
				case 1: {"Search and Rescue"};
				case 2: {"Fire Department"};
			}),true];
		};
		case "civ": {
			MB_Interaction_Target setVariable ["dojRank",_rank,true];
		};
	};
	[getPlayerUID MB_Interaction_Target,_faction,_rank,_department,player] remoteExecCall ["DB_fnc_adjustRank",2];
} else {
	closeDialog 0;
	switch (player getVariable ["faction","civ"]) do {
		case "cop": {
			MB_Interaction_Target setVariable ["copRank",0,true];
			MB_Interaction_Target setVariable ["department",nil,true];
		};
		case "medic": {
			MB_Interaction_Target setVariable ["medicRank",0,true];
			MB_Interaction_Target setVariable ["department",nil,true];
		};
		case "civ": {
			MB_Interaction_Target setVariable ["dojRank",_rank,true];
		};
	};
	[getPlayerUID MB_Interaction_Target,_faction,0,player] remoteExecCall ["DB_fnc_adjustRank",2];
	if !(_faction isEqualTo "civ") then {
		["civ"] remoteExecCall ["DT_fnc_switchDuty",MB_Interaction_Target];
	};
};