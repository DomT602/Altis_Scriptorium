/*
	File: fn_companyLBChanged.sqf
	Author: Dom
	Description: Changes displayed data on LB change
	make the control with RscListBox, then _this call DT_fnc_companyLBchanged;
*/
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];

_selected = company_list select _index;
_selected params ["","_name","_description","_ownerName"];

((findDisplay -1) displayCtrl -1) ctrlSetStructuredText parseText format [
    "Owner:"+ " %1l<br/>" +
    "Description"+ " %2",
    _ownerName,
    _description
];