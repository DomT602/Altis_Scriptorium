/*
	File: fn_logAction.sqf
	Author: Dom
	Description: Logs to DB/server RPT (for cheaters etc)
*/

params [
	["_unit",objNull,[objNull]],
	["_text","",[""]],
	["_sendToDB",false,[false]]
];

if (isNull _unit) exitWith {};

private _name = name _unit;
private _uid = getPlayerUID _unit;

diag_log format["%1 (%2) - %3",_name,_uid,_text];

if (_sendToDB) then {
	[format["logAction:%1:%2:%3",_uid,_name,_text],1] call MySQL_fnc_DBasync;
};