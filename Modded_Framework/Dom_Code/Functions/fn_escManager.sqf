/*
	File: fn_escManager.sqf
	Author: Dom
	Description: Handles when the escape menu is open
*/
private _display = findDisplay 49;
private _abortButton = _display displayCtrl 104;
private _respawnButton = _display displayCtrl 1010;
private _fieldManual = _display displayCtrl 122;
private _abortButton = _display displayCtrl 104;
private _saveButton = _display displayCtrl 103;
private _topButton = _display displayCtrl 2;

_abortButton buttonSetAction "call DT_fnc_saveStatsFull";
_topButton ctrlSetText "Dom ArPee";
_saveButton ctrlSetText format ["UID: %1",getPlayerUID player];
_topButton ctrlEnable false;
_saveButton ctrlEnable false;
_abortButton ctrlEnable false;
_respawnButton ctrlEnable false;
_fieldManual ctrlEnable false;

if (client_blockActions) exitWith {};

private _timer = time + 5;
[
	{
		params ["_timer","_button"];
		_button ctrlSetText format["Abort in %1",[(_timer - time),"SS.MS"] call BIS_fnc_secondsToString];
		_button ctrlCommit 0;
		isNull (findDisplay 49) || player getVariable ["dead",false] || client_blockActions
	},
	{
		params ["","_button"];
		_button ctrlSetText "Aborting interupted";
	},
	[_timer,_abortButton],
	5,
	{
		params ["","_button"];
		_button ctrlSetText localize "STR_DISP_INT_ABORT";
		_button ctrlCommit 0;
		_button ctrlEnable true;
	}
] call CBA_fnc_waitUntilAndExecute;

[
	{
		isNull (findDisplay 49)
	},
	{
		[
			{
				!isNull (findDisplay 49)
			},
			{
				call DT_fnc_escManager
			}
		] call CBA_fnc_waitUntilAndExecute;
	}
] call CBA_fnc_waitUntilAndExecute;