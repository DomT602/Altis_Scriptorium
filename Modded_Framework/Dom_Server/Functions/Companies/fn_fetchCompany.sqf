/*
    File: fn_fetchCompany.sqf
    Author: Dom
    Description: Checks if a person is a company member.
*/
params [
	["_uid","",[""]]
];
scopeName "main";
private _companyData = [];
{
	_x params ["_name","_employees"];
	{
		_x params ["_employeeUID","_rank","_rankName","_salary"];
		if (_uid isEqualTo _employeeUID) exitWith {
			_companyData = [_name,_rank,_rankName,_salary];
			breakTo "main";
		};
	} forEach _employees;
} forEach server_companies;
_companyData;