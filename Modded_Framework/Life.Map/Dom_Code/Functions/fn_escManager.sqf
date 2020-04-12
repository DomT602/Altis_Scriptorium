/*
	File: fn_escManager.sqf
	Author: Dom
	Description: Handles when the escape menu is open
*/
params [
	["_display",displayNull,[displayNull]]
];

private _abortButton = _display displayCtrl 104;
private _respawnButton = _display displayCtrl 1010;
private _fieldManual = _display displayCtrl 122;
private _saveButton = _display displayCtrl 103;
private _topButton = _display displayCtrl 2;

_topButton ctrlSetText "Dom ArPee";
_saveButton ctrlSetText format ["UID: %1",getPlayerUID player];
_topButton ctrlEnable false;
_saveButton ctrlEnable false;
_abortButton ctrlEnable false;
_respawnButton ctrlEnable false;
_fieldManual ctrlEnable false;

if (client_blockActions) exitWith {};

private _timer = CBA_missionTime + 10;
[
	{
		params ["_timer","_button","_display"];
		_button ctrlSetText format["Abort in %1",[(_timer - CBA_missionTime),"SS.MS"] call BIS_fnc_secondsToString];
		_button ctrlCommit 0;
		isNull _display || player getVariable ["dead",false] || client_blockActions
	},
	{
		params ["","_button","_display"];
		if (player getVariable ["dead",false]) then {
			_display closeDisplay 2;
		} else {
			_button ctrlSetText "Aborting interupted";
		};
	},
	[_timer,_abortButton,_display],
	10,
	{
		params ["","_button"];
		_button ctrlSetText localize "STR_DISP_INT_ABORT";
		_button ctrlCommit 0;
		_button ctrlEnable true;
	}
] call CBA_fnc_waitUntilAndExecute;
