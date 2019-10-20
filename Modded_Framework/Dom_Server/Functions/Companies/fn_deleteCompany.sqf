/*
	File: fn_deleteCompany.sqf
	Author: Dom
	Description: Marks a company for deletion
*/
params [
	["_name","",[""]]
];

[format["deleteCompany:%1",_name],1] call MySQL_fnc_DBasync;

private _units = [];
{
	if (_x getVariable ["company",""] isEqualTo _name) then {
		_units pushBack _x
	};
} forEach playableUnits;
if !(_units isEqualTo []) then {
	[_name] remoteExecCall ["DT_fnc_companyDeleted",_units];
};

call DB_fnc_populateCompanies;