/*
	File: fn_companyDeleted.sqf
	Author: Dom
	Description: Notifies employees that their company is closed
*/
params [
	["_name","",[""]]
];
if (_name isEqualTo "") exitWith {};

hint format ["The company %1 has been disbanded, thus you are no longer employed with them.",_name];
player setVariable ["company","none",true];
player setVariable ["company_rank",nil,true];
company_ID = nil;