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

if ((player getVariable ["restrained",false]) || {player getVariable ["tied",false]}) exitWith {}; //stop aborting

[] spawn {
	disableSerialization;
	private _abortButton = (findDisplay 49) displayCtrl 104;
	private _timer = time + 5;

	waitUntil {
		_abortButton ctrlSetText format["Abort in %1",[(_timer - time),"SS.MS"] call BIS_fnc_secondsToString];
		_abortButton ctrlCommit 0;
		round(_timer - time) <= 0 || isNull (findDisplay 49)
	};

	_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
	_abortButton ctrlCommit 0;
	_abortButton ctrlEnable true;
};

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