/*
	File: fn_attachGPS.sqf
	Author: Dom
	Description: Attachs a GPS to selected target
*/
params [
	["_target",objNull,[objNull]]
];

if (isPlayer _target && {!([_target,true] call DT_fnc_checkPlayer)}) exitWith {};
if ((_target isKindOf 'Car' || _target isKindOf 'Air' || _target isKindOf 'Ship') && {!([_target,3] call DT_fnc_checkVehicle)}) exitWith {};
if !("ItemGPS" in (items player)) exitWith {["You need a GPS.","orange"] call DT_fnc_notify};
private _index = client_trackers findIf {_target isEqualTo (_x select 0)};
if (_index != -1) exitWith {["This already has a tracker on.","orange"] call DT_fnc_notify};

["Attaching GPS",15,"AinvPknlMstpSnonWnonDnon_medic_1","isNull objectParent player && ((player distance MB_Interaction_Target) < 5) && (!isNull MB_Interaction_Target)",
{
	if (isPlayer MB_Interaction_Target) then {
		private _name = ["Unknown",MB_Interaction_Target] call DT_fnc_findName;
		client_trackers pushBack [MB_Interaction_Target,_name,(CBA_missionTime + 600)];
	} else {
		client_trackers pushBack [MB_Interaction_Target,getText(configFile >> "CfgVehicles" >> (typeOf MB_Interaction_Target) >> "displayName"),(CBA_missionTime + 1800)];
	};
	player removeItem "ItemGPS";
	["GPS Tracker attached.","green"] call DT_fnc_notify;
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Attaching cancelled."};
		case 2: {"You are dead."};
		case 3: {"Attaching failed."};
	}),"orange"] call DT_fnc_notify;
}] call DT_fnc_progressBar;