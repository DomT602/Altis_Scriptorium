/*
	File: fn_invitedPlayer.sqf
	Author: Dom
	Description: Recieves an invite to join the company
*/
params [
	["_companyName","",[""]],
	["_unit",objNull,[objNull]]
];
if (_unit isEqualTo player) exitWith {};

private _name = ["Unknown",_unit] call DT_fnc_findName;
private _action = [
	format ["You have been invited by %1 to join the company: %2.",_name,_companyName],
	"Employee Invite",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if (_action) then {
	[_companyName,3,player] remoteExecCall ["DB_fnc_updateCompany",2];
	player setVariable ["company",_companyName,true];
	player setVariable ["companyRank",0,true];
	[format["%1 joined your company.",profileName],"green"] remoteExecCall ["DT_fnc_notify",remoteExecutedOwner];
	[format["You joined %1.",_companyName],"green"] call DT_fnc_notify;
} else {
	["You denied the company invite.","orange"] call DT_fnc_notify;
	[format["%1 denied the invite to join your company.",profileName],"red"] remoteExecCall ["DT_fnc_notify",remoteExecutedOwner];
};