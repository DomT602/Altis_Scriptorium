/*
	File: fn_updateCompany.sqf
	Author: Dom
	Description: Updates the desired aspect of the company records
*/
params [
	["_name","",[""]],
	["_mode",0,[0]],
	["_data",0,[0,[],objNull,""]]
];
if (_name isEqualTo "") exitWith {};

switch _mode do {
	case 0: {
		([format["selectCompanyFunds:%1",_name],2] call MySQL_fnc_DBasync) params ["_funds"];
		_funds = _funds + _data;
		[format["addCompanyFunds:%1:%2",_funds,_name],1] call MySQL_fnc_DBasync;
	};
	case 1: {
		([format["selectCompanyFunds:%1",_name],2] call MySQL_fnc_DBasync) params ["_funds"];
		_funds = _funds - _data;
		[format["addCompanyFunds:%1:%2",_funds,_name],1] call MySQL_fnc_DBasync;
	};
	case 2: {
		[format["updateCompanyDescription:%1:%2",_data,_name],1] call MySQL_fnc_DBasync;
		call DB_fnc_populateCompanies;
	};
	case 3: { //new employee
		private _employees = [format["selectCompanyEmployees:%1",_name],2] call MySQL_fnc_DBasync;
		private _array = [getPlayerUID _data,0,"Employee",0];
		_employees pushBack _array;
		[format["updateCompanyEmployee:%1:%2",_employees,_name],1] call MySQL_fnc_DBasync;
	};
	case 4: { //update employee
		private _employees = [format["selectCompanyEmployees:%1",_name],2] call MySQL_fnc_DBasync;
		private _index = _employees findIf {(_x select 0) isEqualTo _data};
		if (_index isEqualTo -1) exitWith {};
		private _employeeToUpdate = _employees select _index;
		_employeeToUpdate set [1,_rank];
		_employeeToUpdate set [2,_rankName];
		_employeeToUpdate set [3,_salary];
		_employees set [_index,_employeeToUpdate];
		[format["updateCompanyEmployee:%1:%2",_employees,_name],1] call MySQL_fnc_DBasync;
	};
	case 5: { //remove employee
		private _employees = [format["selectCompanyEmployees:%1",_name],2] call MySQL_fnc_DBasync;
		private _index = _employees findIf {(_x select 0) isEqualTo _data}; //_data is UID
		if (_index isEqualTo -1) exitWith {};
		_employees deleteAt _index;
		[format["updateCompanyEmployee:%1:%2",_employees,_name],1] call MySQL_fnc_DBasync;
	};
	case 6: {
		([format["selectCompanyFunds:%1",_name],2] call MySQL_fnc_DBasync) params ["_funds"];
		["recieveFunds",_funds] remoteExecCall ["DT_fnc_manageCompany",remoteExecutedOwner];
	};
};