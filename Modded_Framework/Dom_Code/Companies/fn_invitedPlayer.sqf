/*
	File: fn_invitedPlayer.sqf
	Author: Dom
	Description: Recieves an invite to join the company
*/
params [
	["_unit",objNull,[objNull]],
	["_companyName","",[""]],
	["_ID",-1,[0]]
];
if (isNull _unit || {_ID isEqualTo -1}) exitWith {};

private _action = [
    format ["You have been invited by %1 to join the company: %2.",name _unit,_companyName],
    "Employee Invite",
    "Yes",
    "No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [_ID,3,player] remoteExecCall ["DB_fnc_updateCompany",2];
    player setVariable ["company",_companyName,true];
    player setVariable ["company_rank",0,true];
    company_ID = _ID;
    [format["%1 joined your company.",name player],"green"] remoteExecCall ["DT_fnc_notify",_unit];
} else {
    ["You denied the company invite.","orange"] call DT_fnc_notify;
    [format["%1 denied the invite to join your company.",name player],"red"] remoteExecCall ["DT_fnc_notify",_unit];
};