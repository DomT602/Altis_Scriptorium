/*
	File: fn_openCompanyMenu.sqf
	Author: Dom
	Description: Opens the general company menu
*/
createDialog "DT_showCompanies";
private _display = findDisplay 1025;
private _listbox = _display displayCtrl 1500;

{
	_x params [
		["_name","",[""]]
	];
	_listbox lbAdd _name;
} forEach company_list;

if (player getVariable ["company",""] isEqualTo "") then {
	(_display displayCtrl 1600) ctrlSetText "Create a Company";
};