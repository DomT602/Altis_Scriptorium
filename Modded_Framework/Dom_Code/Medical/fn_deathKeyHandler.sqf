/*
	File: fn_deathKeyHandler.sqf
	Author: Dom
	Description: Monitors key usage while the player is dead
*/
params [
    ["_ctrl",displayNull,[displayNull]],
    ["_code",-1,[0]],
    ["_shift",false,[false]],
    ["_ctrl",false,[false]],
    ["_alt",false,[false]]
];

if (_code isEqualTo 1) exitWith {true};
if (_code isEqualTo 62 && _alt) exitWith {call DT_fnc_saveStatsFull; [player,"Possible Combat Log (Alt+F4)",false] remoteExecCall ["server_fnc_logAction",2]; diag_log format ["%1 just used alt+f4, possible combat log",profileName]; true};
if (_code isEqualTo 211 && _alt && _ctrl) exitWith {call DT_fnc_saveStatsFull; [player,"Possible Combat Log (Ctrl+Alt+Delete)",false] remoteExecCall ["server_fnc_logAction",2]; diag_log format ["%1 used Ctrl+Alt+Delete while dead, there is a high chance of a combat log, especially if followed by a game crash",profileName]; true};
if (_code isEqualTo 74 && _shift) exitWith {call DT_fnc_saveStatsFull; [player,"Possible Combat Log (Shift+-)",false] remoteExecCall ["server_fnc_logAction",2]; diag_log format ["%1 just used shift minus, possible combat log",profileName]; true};