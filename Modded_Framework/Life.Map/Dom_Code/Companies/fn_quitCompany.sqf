/*
	File: fn_quitCompany.sqf
	Author: Dom
	Description: Quits the players company
*/
closeDialog 0;
private _company = player getVariable ["company",""];
[_company,5,getPlayerUID player] remoteExecCall ["DB_fnc_updateCompany",2];
player setVariable ["company",nil,true];
player setVariable ["companyRank",nil,true];
[format["You quit your job at %1.",_company],"green"] call DT_fnc_notify;