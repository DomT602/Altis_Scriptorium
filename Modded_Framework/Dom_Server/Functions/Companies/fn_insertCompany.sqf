/*
	File: fn_insertCompany.sqf
	Author: Dom
	Description: Inserts a company into the DB
*/
params [
	["_uid","",[""]],
	["_name","",[""]],
	["_description","",[""]]
];
if (_uid isEqualTo "") exitWith {};

private _origMember = [[_uid,3,0]]; //uid, rank, salary
[format["insertCompany:%1:%2:%3:%4",_uid,_name,_description,_origMember],1] call MySQL_fnc_DBasync;
call DB_fnc_populateCompanies;
[_name] remoteExecCall ["DT_fnc_companyCreated",remoteExecutedOwner];
