/*
	File: fn_showCompany.sqf
	Author: Dom
	Description: Either shows the create company menu or your own companies details
*/
closeDialog 0;
private _company = player getVariable ["company",""];
if (_company isEqualTo "") then {
	createDialog "DT_createCompany";
} else {
	createDialog "DT_myCompany";
	private _display = findDisplay 1027;

	private _index = company_list findIf {_x select 0 isEqualTo _company};
	if (_index isEqualTo -1) exitWith {["Company not found.","red"] call DT_fnc_notify; closeDialog 0};
	(company_list select _index) params ["_name","","","_tasks"];
	if (player getVariable ["companyRank",0] < 2) then {
		(_display displayCtrl 1601) ctrlEnable false;
	};
	(_display displayCtrl 1100) ctrlSetStructuredText parseText _name;
	(_display displayCtrl 1101) ctrlSetStructuredText parseText _tasks;

	private _tree = _display displayCtrl 1500;
	_tree tvAdd [[],"Employees"];
	_tree tvAdd [[],"Supervisors"];
	_tree tvAdd [[],"Managers"];
	_tree tvAdd [[],"Owners"];
	{
		if (_x getVariable ["company",""] isEqualTo _name) then {
			_tree tvAdd [[_x getVariable ["companyRank",0]],name _x];
		};
	} forEach playableUnits;
};