/*
	File: fn_populateCompanies.sqf
	Author: Dom
	Description: Populates a list of companies, call everytime a company is made/deleted, and at server start
*/
private _return = ["populateCompanies",2] call MySQL_fnc_DBasync;
if !(_return isEqualTo []) then {
	company_list = _return
} else {
	company_list = []
};
publicVariable "company_list";