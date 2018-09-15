/*
	File: fn_insertTicket.sqf
	Author: Dom
	Description: Inserts ticket into the DB
*/

params [
	["_name","",[""]],
	["_crimes","",[""]],
	["_officer","",[""]],
	["_cost",1000,[0]]
];

[format["insertTicket:%1:%2:%3:%4",_name,_crimes,_officer,_cost],1] call MySQL_fnc_DBasync;