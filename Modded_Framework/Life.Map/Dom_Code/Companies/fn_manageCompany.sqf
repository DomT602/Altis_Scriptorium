/*
	File: fn_manageCompany.sqf
	Author: Dom
	Description: Handles various management actions
*/
params [
	["_action","",[""]],
	["_data",0,[0,[],true]]
];

switch _action do {
	case "init": {
		createDialog "DT_manageCompany";
		private _company = player getVariable ["company",""];
		private _index = company_list findIf {_x select 0 isEqualTo _company};
		if (_index isEqualTo -1) exitWith {["Company not found.","red"] call DT_fnc_notify; closeDialog 0};
		(company_list select _index) params ["_name","_description","","_tasks"];
		private _display = findDisplay 1028;
		(_display displayCtrl 1100) ctrlSetStructuredText parseText _name;
		(_display displayCtrl 1400) ctrlSetText _tasks;
		(_display displayCtrl 1401) ctrlSetText _description;
	};
	case "recieveFunds": {
		private _display = findDisplay 1030;
		if (isNull _display) then {_display = findDisplay 1038};
		if (isNull _display) exitWith {};
		uiNamespace setVariable ["compFunds",_data];
		(_display displayCtrl 1102) ctrlSetStructuredText parseText format["Company funds: $%1",_data];
	};
	case "updateDescription": {
		private _display = findDisplay 1028;
		private _descriptionBox = _display displayCtrl 1401;
		private _description = ctrlText _descriptionBox;
		if !([_description] call DT_fnc_checkText) exitWith {};
		if (count _description > 256) exitWith {["The description cannot be this long.","orange"] call DT_fnc_notify};
		["Description updated.","green"] call DT_fnc_notify;
		[player getVariable ["company",""],2,_description] remoteExecCall ["DB_fnc_updateCompany",2];
	};
	case "updateTasks": {
		private _display = findDisplay 1028;
		private _taskBox = _display displayCtrl 1400;
		private _tasks = ctrlText _taskBox;
		if !([_tasks] call DT_fnc_checkText) exitWith {};
		if (count _tasks > 256) exitWith {["The tasks cannot be this long.","orange"] call DT_fnc_notify};
		["Tasks updated.","green"] call DT_fnc_notify;
		[player getVariable ["company",""],7,_tasks] remoteExecCall ["DB_fnc_updateCompany",2];
	};
	case "treeChange": {
		_data params ["_control","_selectionPath"];
		private _salary = _control tvValue _selectionPath;
		private _display = findDisplay 1028;
		(_display displayCtrl 1402) ctrlSetText str(_salary);
	};
	case "populateEmployees": {
		private _display = findDisplay 1028;
		private _tree = _display displayCtrl 1500;
		tvClear _tree;
		_tree tvAdd [[],"Employees"];
		_tree tvAdd [[],"Supervisors"];
		_tree tvAdd [[],"Managers"];
		_tree tvAdd [[],"Owners"];

		{
			_x params ["_uid","_rank","_salary","_name"];
			_tree tvAdd [[_rank],_name];
			_tree tvSetData [[_rank,(_tree tvCount [_rank])-1],_uid];
			_tree tvSetValue [[_rank,(_tree tvCount [_rank])-1],_salary];
		} forEach _data;

		{
			_tree tvSortByValue [[_x],false];
		} forEach [0,1,2,3];
	};
	case "updateEmployee": {
		private _display = findDisplay 1028;
		private _tree = _display displayCtrl 1500;
		private _selectionPath = tvCurSel _tree;
		if (count _selectionPath < 2) exitWith {["You need to select somebody.","orange"] call DT_fnc_notify};
		if ((_selectionPath select 0) >= (player getVariable ["companyRank",0])) exitWith {["You can only update ranks of those under you.","orange"] call DT_fnc_notify};
		private _uid = _tree tvData _selectionPath;
		private _name = _tree tvText _selectionPath;
		private _salary = _tree tvValue _selectionPath;
		_selectionPath params ["_rank"];
		if (_data) then {
			_rank = _rank + 1;
		} else {
			_rank = _rank - 1;
		};
		_tree tvDelete _selectionPath;
		_tree tvAdd [[_rank],_name];
		_tree tvSetData [[_rank,(_tree tvCount [_rank])-1],_uid];
		_tree tvSetValue [[_rank,(_tree tvCount [_rank])-1],_salary];
		_tree tvSortByValue [[_rank],false];
		_tree tvSetCurSel [-1];
		["Rank changed."] call DT_fnc_notify;
		[(player getVariable ["company",""]),4,[_uid,_rank]] remoteExecCall ["DB_fnc_updateCompany",2];
		private _unit = [_uid] call DT_fnc_findPlayer;
		if !(isNull _unit) then {
			_unit setVariable ["companyRank",_rank,true];
			["Your company rank has been changed."] remoteExecCall ["DT_fnc_notify",_unit];
		};
	};
	case "updateSalary": {
		private _display = findDisplay 1028;
		private _tree = _display displayCtrl 1500;
		private _selectionPath = tvCurSel _tree;
		if (count _selectionPath < 2) exitWith {["You need to select somebody.","orange"] call DT_fnc_notify};
		if (((_selectionPath select 0) >= (player getVariable ["companyRank",0])) && (player getVariable ["companyRank",0]) != 3) exitWith {["You can only update salaries of those under you.","orange"] call DT_fnc_notify};
		private _uid = _tree tvData _selectionPath;
		private _salary = _tree tvValue _selectionPath;
		private _newSalary = ctrlText 1402;
		if !([_newSalary,-1] call DT_fnc_checkNumber) exitWith {};
		_newSalary = parseNumber _newSalary;
		if (_salary isEqualTo _newSalary) exitWith {["Salary is unchanged.","orange"] call DT_fnc_notify};
		_tree tvSetValue [_selectionPath,_newSalary];
		["Salary changed."] call DT_fnc_notify;
		[(player getVariable ["company",""]),9,[_uid,_newSalary]] remoteExecCall ["DB_fnc_updateCompany",2];
		private _unit = [_uid] call DT_fnc_findPlayer;
		if !(isNull _unit) then {
			_unit setVariable ["companySalary",_newSalary,true];
			["Your company salary has been changed."] remoteExecCall ["DT_fnc_notify",_unit];
		};
	};
	case "removeEmployee": {
		private _display = findDisplay 1028;
		private _tree = _display displayCtrl 1500;
		private _selectionPath = tvCurSel _tree;
		if (count _selectionPath < 2) exitWith {["You need to select somebody.","orange"] call DT_fnc_notify};
		if ((_selectionPath select 0) >= (player getVariable ["companyRank",0])) exitWith {["You can only fire ranks of those under you.","orange"] call DT_fnc_notify};
		private _uid = _tree tvData _selectionPath;
		private _name = _tree tvText _selectionPath;
		_tree tvDelete _selectionPath;
		[format["You successfully fired %1.",_name]] call DT_fnc_notify;
		[(player getVariable ["company",""]),5,_uid] remoteExecCall ["DB_fnc_updateCompany",2];
		private _unit = [_uid] call DT_fnc_findPlayer;
		if !(isNull _unit) then {
			_unit setVariable ["companyRank",nil,true];
			_unit setVariable ["company",nil,true];
			_unit setVariable ["companySalary",nil,true];
			[format["Your have been fired from %1.",(player getVariable ["company",""])],"red"] remoteExecCall ["DT_fnc_notify",_unit];
		};
	};
};