/*
    File: fn_fetchCompany.sqf
    Author: Dom
    Description: Checks if a person is a company member.
*/
params [
	["_uid","",[""]]
];

private _queryResult = ["fetchCompanies",2] call MySQL_fnc_DBasync;

private _companyData = [];
{
	_queryResult params ["_id","_name","_employees"];
	{
		_x params ["_employeeUID","_rank","_rankName","_salary"];
		if (_uid isEqualTo _employeeUID) exitWith {
			_companyData = [_id,_name,_rank,_salary]
		};
	} forEach _employees;
	if !(_companyData isEqualTo []) exitWith {};
} forEach _queryResult;
_companyData;