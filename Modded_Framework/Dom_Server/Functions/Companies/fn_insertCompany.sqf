/*
	File: fn_insertCompany.sqf
	Author: Dom
	Description: Inserts a company into the DB
*/
params [
	["_uid","",[""]],
	["_ownerName","",[""]],
	["_name","",[""]],
	["_description","",[""]]
];

if (_uid isEqualTo "" || {_name isEqualTo ""} || {_description isEqualTo ""}) exitWith {};

private _origMember = [[_uid,3,"CEO",0]]; //uid, rank, name of rank, salary

[format["insertCompany:%1:%2:%3:%4:%5",_uid,_ownerName,_name,_description,_origMember],1] call MySQL_fnc_DBasync;

[_name] remoteExecCall ["DT_fnc_createdCompany",remoteExecutedOwner];
call DB_fnc_populateCompanies;