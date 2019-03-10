/*
	File: fn_clickChecker.sqf
	Author: Dom
	Description: Adds an EVH to selected display to catch auto-clicking
*/
 params [
	["_displayNumber",46,[0]],
	["_type","MouseButtonDown",[""]]
 ];

(findDisplay _displayNumber) displayAddEventHandler [_type,{
	client_clicks = client_clicks + 1;
	[
		{
			client_clicks = client_clicks - 1;
		},
		0,
		1
	] call CBA_fnc_waitAndExecute;
	if (client_clicks > 24) then {
		disableUserInput true;
		[player,format["Possible autoclicking detected: %1",client_clicks],true] remoteExecCall ["server_fnc_logAction",2];
		["Pleb.","red"] call DT_fnc_notify;
		[
			{
				closeDialog 0;
				disableUserInput false;
			},
			0,
			5
		] call CBA_fnc_waitAndExecute;
	};
}];