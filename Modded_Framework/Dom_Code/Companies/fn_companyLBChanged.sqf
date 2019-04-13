/*
	File: fn_companyLBChanged.sqf
	Author: Dom
	Description: Changes displayed data on LB change
*/
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];

(company_list select _index) params ["","_description","_ownerName"];

((findDisplay 1025) displayCtrl 1100) ctrlSetStructuredText parseText format [
	"Owner: %1 <br/>Description: %2",
	_ownerName,_description
];