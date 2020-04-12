/*
	File: fn_repairTerrainObject.sqf
	Author: Dom
	Description: Repairs the closest object
*/

(nearestTerrainObjects [player,[],4]) params [["_closestObject",objNull,[objNull]]];
if (isNull _closestObject) exitWith {};
if (getDammage _closestObject isEqualTo 0) exitWith {["This does not need repairing."] call DT_fnc_notify};
MB_Interaction_Target = _closestObject;

["Repairing",10,"Acts_carFixingWheel","isNull objectParent player",
{
	["Repairing finished.","green"] call DT_fnc_notify;
	MB_Interaction_Target setDamage 0;
	[player,""] remoteExecCall ["switchMove",-2];
	["cash",100] call DT_fnc_handleMoney;
	["You were paid $100 for repairing this object.","green"] call DT_fnc_notify;
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
}] call DT_fnc_progressBar;