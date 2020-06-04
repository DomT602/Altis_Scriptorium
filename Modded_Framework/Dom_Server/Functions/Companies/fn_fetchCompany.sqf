/*
	File: fn_fetchCompany.sqf
	Author: Dom
	Description: Checks if a person is a company member.
*/
params [
	["_uid","",[""]]
];

private _return = [];
{
	_x params ["_name","_employees"];
	{
		_x params ["_employeeUID","_rank","_salary"];
		if (_uid isEqualTo _employeeUID) exitWith {
			_return = [_name,_rank,_salary];
		};
	} forEach _employees;
} forEach server_companies;
_return