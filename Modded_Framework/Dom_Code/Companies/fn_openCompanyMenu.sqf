/*
	File: fn_openCompanyMenu.sqf
	Author: Dom
	Description: Opens the general company menu
*/
createDialog "DT_Company_Menu";

if (player getVariable "company" isEqualTo "none") then { //for my own company menu
	ctrlShow [-1,false];
};

private _companyList = (findDisplay -1) displayCtrl -1;
lbClear _companyList;
{
	private _index = _forEachIndex;
	_x params [
		"_ID",
		"_name"
	];
	_companyList lbAdd _name;
	_companyList lbSetValue [_index,_ID];
} forEach company_list;