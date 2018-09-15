/*
	File: fn_deleteCompany.sqf
	Author: Dom
	Description: Marks a company for deletion
*/
params [
	["_ID",-1,[0]],
	["_name","",[""]]
];

if (_ID isEqualTo -1 || {_name isEqualTo ""}) exitWith {};

[format["deleteCompany:%1",_ID],1] call MySQL_fnc_DBasync;

private _units = [];
{
	if (_x getVariable ["company",""] isEqualTo _name) then {
		_units pushBack _x
	};
} forEach playableUnits;
[_name] remoteExecCall ["DT_fnc_companyDeleted",_units];

["CALL deleteOldCompanies",1] call MySQL_fnc_DBasync;
call DB_fnc_populateCompanies;