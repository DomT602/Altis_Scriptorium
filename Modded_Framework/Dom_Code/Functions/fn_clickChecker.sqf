/*
	File: fn_clickChecker.sqf
	Author: Dom
	Description: Called by onMouseButtonDown for all dialogs
*/
params [
	["_display",displayNull,[displayNull]],
	["_button",-1,[0]]
];

client_clicks = client_clicks + 1;
[
	{
		client_clicks = client_clicks - 1;
	},
	0,
	1
] call CBA_fnc_waitAndExecute;
if (client_clicks > 14) then {
	[player,format["Possible autoclicking detected - %1 clicks",client_clicks]] remoteExecCall ["server_fnc_logAction",2];
	closeDialog 0;
};