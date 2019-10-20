/**
*
*	Author: MrBoolean
*	Website: http://mrboolean.io
*	Name: fn_openRadial.sqf
*	Description: Loads the interaction menu and populates it with data
*
**/
params[["_target",objNull,[objNull]]];

MB_Interaction_Target = _target;
MB_actionList = [];
MB_overflowList = [];

private _sharedOptions = (missionConfigFile >> "Interactions" >> "shared") call BIS_fnc_getCfgSubClasses;
private _side = player getVariable ["faction","civ"];
private _sideOptions = (missionConfigFile >> "Interactions" >> _side) call BIS_fnc_getCfgSubClasses;

{
	private _check = (missionConfigFile >> "Interactions" >> "shared" >> _x >> "check") call BIS_fnc_getCfgData;

	if (call compile _check) then {
		private _action = (missionConfigFile >> "Interactions" >> "shared" >> _x >> "action") call BIS_fnc_getCfgData;
		private _title = (missionConfigFile >> "Interactions" >> "shared" >> _x >> "title") call BIS_fnc_getCfgData;
		if(count MB_actionList >= 7) then {
			MB_overflowList pushBack [_title,_action];
		} else {
			MB_actionList pushBack [_title,_action];
		};
	};
} forEach _sharedOptions;

{
	private _check = (missionConfigFile >> "Interactions" >> _side >> _x >> "check") call BIS_fnc_getCfgData;

	if (call compile _check) then {
		private _action = (missionConfigFile >> "Interactions" >> _side >> _x >> "action") call BIS_fnc_getCfgData;
		private _title = (missionConfigFile >> "Interactions" >> _side >> _x >> "title") call BIS_fnc_getCfgData;
		if(count MB_actionList >= 7) then {
			MB_overflowList pushBack [_title,_action];
		} else {
			MB_actionList pushBack [_title,_action];
		};
	};
} forEach _sideOptions;
if (MB_actionList isEqualTo []) exitWith {};

if !(MB_overflowList isEqualTo []) then {
	if(count MB_overflowList < 2) then {
		MB_actionList pushBack [(MB_overflowList select 0 select 0),(MB_overflowList select 0 select 1)];
	} else {
		MB_actionList pushBack ["More Options","call DT_fnc_moreRadialOptions"];
	};
};

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
		isNull (findDisplay 1000) || !(_oldState isEqualTo (vehicle player)) || client_blockActions
	},
	{
		if !(isNull (uiNamespace getVariable ["Progress_Bar",controlNull])) exitWith {}; //progress bar safety check
		private _display = findDisplay 1000;
		if !(isNull _display) exitWith {_display closeDisplay 2};
	},
	vehicle player
] call CBA_fnc_waitUntilAndExecute;