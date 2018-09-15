/*
	File: fn_invitePlayer.sqf
	Author: Dom
	Description: Sends invite to player to join company
*/
params [
	["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};

private _action = [
    format["Are you sure you want to invite %1 to join your company?",name _unit], //message
    "Employee Invite",
    "Yes",
    "No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [player,player getVariable "company",company_ID] remoteExec ["DT_fnc_invitedPlayer",_unit];
} else {
    ["Invite cancelled","orange"] call DT_fnc_notify;
};