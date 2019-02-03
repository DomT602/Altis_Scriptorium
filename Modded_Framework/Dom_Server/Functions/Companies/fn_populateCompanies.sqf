/*
	File: fn_populateCompanies.sqf
	Author: Dom
	Description: Populates a list of companies, call everytime a company is made/deleted, and at server start
*/
[
	{
		private _return = ["populateCompanies",2,true] call MySQL_fnc_DBasync;
		server_companies = [];
		{
			_x params ["_name","","","","_employees"];
			server_companies pushBack [_name,_employees];
			_x deleteAt 4;
		} forEach _return;

		company_list = _return;
		publicVariable "company_list";
	},
	0,
	0.3
] call CBA_fnc_waitAndExecute;