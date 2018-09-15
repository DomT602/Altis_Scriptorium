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
	if !(client_clicking) then {
		client_clicking = true;
	};
	client_clicks = client_clicks + 1;
	[
		{
			client_clicks = client_clicks - 1;
		},
		[],
		1
	] call CBA_fnc_waitAndExecute;
	if (client_clicks > 24 && client_clicking) then {
		client_clicking = false;
		disableUserInput true;
		[player,format["Possible autoclicking detected: %1",client_clicks],true] remoteExecCall ["server_fnc_logAction",2];
		["Pleb.","red"] call DT_fnc_notify;
		[
			{
				closeDialog 0;
				disableUserInput false;
			},
			[],
			5
		] call CBA_fnc_waitAndExecute;
	};
}];