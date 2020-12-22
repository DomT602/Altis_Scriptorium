/*
	File: fn_handleChatMessage.sqf
	Author: Dom
	Description: Handles incoming chat messages
*/
params [
	["_channel",0,[0]],
	["_owner",0,[0]],
	["_from","",[""]],
	["_text","",[""]],
	["_person",objNull,[objNull]]
];
if (_channel isEqualTo 16) exitWith {}; //systemChat message
private _return = nil;

if (player isEqualTo _person) then {
	if (_text == "!upt") then {
		private _hours = floor(CBA_missionTime / 3600);
		private _minutes = floor((CBA_missionTime mod 3600) / 60);
		systemChat format["Server uptime: %1 hours %2 minutes.",_hours,_minutes];
		_return = true;
	};
};

_return;