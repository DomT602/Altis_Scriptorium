/*
	File: fn_insertTicket.sqf
	Author: Dom
	Description: Inserts ticket into the DB
*/
params [
	["_name","",[""]],
	["_reason","",[""]],
	["_value",1000,[0]],
	["_officer","",[""]]
];

[format["insertTicket:%1:%2:%3:%4",_name,_reason,_officer,_value],1] call MySQL_fnc_DBasync;