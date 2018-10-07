/*
    File: fn_changeRank.sqf
    Author: Dom
    Description: Takes data from menu and sends request to server to update targets rank/department
*/

private _department = lbCurSel 9202;
private _rank = lbCurSel 9201;
if (_department isEqualTo -1) exitWith {["You need to select a department.","orange"] call DT_fnc_notify};
if (_rank isEqualTo -1) exitWith {["You need to select a rank.","orange"] call DT_fnc_notify};

_rank = _rank + 1;
private _faction = player getVariable ["faction",""];
closeDialog 0;

switch _faction do {
	case "cop": {
		MB_Interaction_Target setVariable ["cop_rank",_rank,true];
		MB_Interaction_Target setVariable ["department",(switch _department do {
			case 0: {"Patrol"};
			case 1: {"Department of Corrections"};
			case 2: {"Highway Patrol"};
			case 3: {"SWAT"};
			case 4: {"DTU"};
			case 5: {"High Command"};
		}),true];
	};
	case "medic": {
		MB_Interaction_Target setVariable ["medic_rank",_rank,true];
		MB_Interaction_Target setVariable ["department",(switch _department do {
			case 0: {"EMS"};
			case 1: {"Search and Rescue"};
			case 2: {"Fire Department"};
			case 3: {"High Command"};
		}),true];
	};
	case "doj": {};
};

[getPlayerUID MB_Interaction_Target,_faction,_rank,_department] remoteExecCall ["DB_fnc_adjustRank",2];