/*
	File: fn_companyDeleted.sqf
	Author: Dom
	Description: Notifies employees that their company is closed
*/
params [
	["_name","",[""]]
];
if (_name isEqualTo "") exitWith {};

[format["The company %1 has been disbanded, thus you are no longer employed with them.",_name],"red"] call DT_fnc_notify;
player setVariable ["company",nil,true];
player setVariable ["companyRank",nil,true];