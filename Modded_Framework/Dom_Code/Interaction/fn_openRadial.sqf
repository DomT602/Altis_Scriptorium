/**
*
*	Author: MrBoolean
*	Website: http://mrboolean.io
*	Name: fn_openRadial.sqf
*	Description: Loads the interaction menu and populates it with data
*
**/
disableSerialization;
if (player getVariable ["restrained",false] || player getVariable ["tied",false]) exitWith {["You can't do this while restrained","red",5] call DT_fnc_notify};
params[["_target",objNull,[objNull]]];

MB_Interaction_Target = _target;
MB_actionList = [];
MB_overflowList = [];

/* Load all our interaction options */
private _sharedOptions = (missionConfigFile >> "Interactions" >> "shared") call BIS_fnc_getCfgSubClasses;
private _side = player getVariable ["faction","civ"];

private _sideOptions = switch _side do {
	case "cop": {
		(missionConfigFile >> "Interactions" >> "cop") call BIS_fnc_getCfgSubClasses;
	};
	case "civ": {
		(missionConfigFile >> "Interactions" >> "civ") call BIS_fnc_getCfgSubClasses;
	};
	case "medic": {
		(missionConfigFile >> "Interactions" >> "medic") call BIS_fnc_getCfgSubClasses;
	};
};

{
	private _check = (missionConfigFile >> "Interactions" >> "shared" >> _x >> "check") call BIS_fnc_getCfgData;
	private _action = (missionConfigFile >> "Interactions" >> "shared" >> _x >> "action") call BIS_fnc_getCfgData;
	private _title = (missionConfigFile >> "Interactions" >> "shared" >> _x >> "title") call BIS_fnc_getCfgData;

	if (call compile _check) then {
		if(count MB_actionList >= 7) then {
			MB_overflowList pushBack [_title,_action];
		} else {
			MB_actionList pushBack [_title,_action];
		};
	};
} forEach _sharedOptions;

//Side Options
{
		private _check = "";
		private _action = "";
		private _title = "";
		switch _side do {
			case "cop": {
				_check = (missionConfigFile >> "Interactions" >> "cop" >> _x >> "check") call BIS_fnc_getCfgData;
				_action = (missionConfigFile >> "Interactions" >> "cop" >> _x >> "action") call BIS_fnc_getCfgData;
				_title = (missionConfigFile >> "Interactions" >> "cop" >> _x >> "title") call BIS_fnc_getCfgData;
			};
			case "civ": {
				_check = (missionConfigFile >> "Interactions" >> "civ" >> _x >> "check") call BIS_fnc_getCfgData;
				_action = (missionConfigFile >> "Interactions" >> "civ" >> _x >> "action") call BIS_fnc_getCfgData;
				_title = (missionConfigFile >> "Interactions" >> "civ" >> _x >> "title") call BIS_fnc_getCfgData;
			};
			case "medic": {
				_check = (missionConfigFile >> "Interactions" >> "medic" >> _x >> "check") call BIS_fnc_getCfgData;
				_action = (missionConfigFile >> "Interactions" >> "medic" >> _x >> "action") call BIS_fnc_getCfgData;
				_title = (missionConfigFile >> "Interactions" >> "medic" >> _x >> "title") call BIS_fnc_getCfgData;
			};
		};

		if (call compile _check) then {
			if(count MB_actionList >= 7) then {
				MB_overflowList pushBack [_title,_action];
			} else {
				MB_actionList pushBack [_title,_action];
			};
		};
} forEach _sideOptions;


/* Check for More Options */

if !(MB_overflowList isEqualTo []) then {
	if(count MB_overflowList < 2) then {
		MB_actionList pushBack [(MB_overflowList select 0 select 0),(MB_overflowList select 0 select 1)];
	} else {
		MB_actionList pushBack ["More Options","call DT_fnc_moreRadialOptions;"];
	};
};

//Only load if we've got interactions! Dumbass
if (MB_actionList isEqualTo []) exitWith {};

//Load our UI
closeDialog 0;
createDialog "MB_Interaction_Menu";

private _idd = 1001;

{
	_x params ["_text"];
	ctrlSetText[_idd,_text];
	_idd = _idd + 1;
} forEach MB_actionList;

[
	{
		params ["_oldState"];
		isNull (findDisplay 1000) || !(_oldState isEqualTo (vehicle player)) || player getVariable ["restrained",false] || player getVariable ["tied",false]
	},
	{
		if !(isNull (findDisplay 1000)) exitWith {closeDialog 0};
	},
	vehicle player
] call CBA_fnc_waitUntilAndExecute;