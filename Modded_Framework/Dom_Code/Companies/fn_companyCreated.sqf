/*
	File: fn_companyCreated.sqf
	Author: Dom
	Description: Notifies the user that they created the company, and sets some variables
*/
params [
	["_name","",[""]]
];
hint format["Congratulations, you are the owner of a new company called %1.",_name];
player setVariable ["company",_name,true];
player setVariable ["company_rank",3,true];