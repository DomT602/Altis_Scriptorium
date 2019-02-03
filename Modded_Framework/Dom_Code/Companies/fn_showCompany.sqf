/*
	File: fn_showCompany.sqf
	Author: Dom
	Description: Either shows the create company menu or your own companies details
*/
closeDialog 0;
if (player getVariable ["company",""] isEqualTo "") then {
	createDialog "DT_createCompany";
} else {
	createDialog "DT_myCompany";
	private _display = findDisplay -1;

	private _index = company_list findIf {_x select 0 isEqualTo (player getVariable ["company",""])};
	if (_index isEqualTo -1) exitWith {["Company not found.","red"] call DT_fnc_notify; closeDialog 0};
	(company_list select _index) params ["_name","_description","_ownerName","_tasks"];
	if (player getVariable ["company_rank",0] < 2) then {
		(_display displayCtrl -1) ctrlEnable false;
	};
	(_display displayCtrl -1) ctrlSetStructuredText parseText _name;
	(_display displayCtrl -1) ctrlSetStructuredText parseText _ownerName;
	(_display displayCtrl -1) ctrlSetStructuredText parseText _tasks;
	(_display displayCtrl -1) ctrlSetStructuredText parseText (player getVariable ["company_position",""]);
	private _listbox = _display displayCtrl -1;
	{
		if (_x getVariable ["company",""] isEqualTo _name) then {
			_listbox lbAdd (name _x);
		};
	} forEach playableUnits;
};