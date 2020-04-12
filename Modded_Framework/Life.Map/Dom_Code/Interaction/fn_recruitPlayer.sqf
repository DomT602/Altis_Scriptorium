/*
	File: fn_recruitPlayer.sqf
	Author: Dom
	Description: Starts the recruitment process for a player
*/
params [
	["_faction","civ",[""]],
	["_unit",objNull,[objNull]]
];

private _name = ["someone",_unit] call DT_fnc_findName;
private _action = [
	format ["Are you sure you want to recruit %1?",_name],
	"Recruitment",
	"Yes",
	"Cancel"
] call BIS_fnc_guiMessage;


if (_action) then {
	["Recruitment request sent."] call DT_fnc_notify;
	[_faction,player] remoteExec ["DT_fnc_recruitResponse",_unit];
} else {
	["Recruitment cancelled.","orange"] call DT_fnc_notify;
};
