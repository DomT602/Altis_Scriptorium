/*
	File: fn_updateCompany.sqf
	Author: Dom
	Description: Updates the desired aspect of the company records
*/
params [
	["_ID",-1,[0]],
	["_mode",0,[0]],
	["_data",0,[0,[],objNull,""]]
];

if (_id isEqualTo -1) exitWith {};

switch _mode do {
	case 0: { //add funds
		private _funds = [format["selectCompanyFunds:%1",_ID],2] call MySQL_fnc_DBasync;
		_funds = _funds + _data;
		_query = format ["UPDATE companies SET bank='%1' WHERE id='%2'",_funds,_ID];
	};
	case 1: { //remove funds
		private _funds = [format["selectCompanyFunds:%1",_ID],2] call MySQL_fnc_DBasync;
		_funds = _funds - _data;
		_query = format ["UPDATE companies SET bank='%1' WHERE id='%2'",_funds,_ID];
	};
	case 2: { //update description
		_query = format ["UPDATE companies SET description='%1' WHERE id='%2'",_data,_ID];
	};
	case 3: { //new employee
		private _employees = [format["selectCompanyEmployees:%1",_ID],2] call MySQL_fnc_DBasync;
		private _array = [getPlayerUID _data,0,"Employee",0];
		_employees pushBack _array;
		[format["updateCompanyEmployee:%1:%2",_employees,_ID],2] call MySQL_fnc_DBasync;
	};
	case 4: { //update employee
		private _employees = [format["selectCompanyEmployees:%1",_ID],2] call MySQL_fnc_DBasync;
		_data params ["_uid"];
		private "_index";
		{
			_x params [
				["_oldUID","",[""]]
			];
			if (_oldUID isEqualTo _uid) exitWith {
				_index = _forEachIndex
			};
		} forEach _employees;
		private _employeeToUpdate = _employees select _index;
		_employeeToUpdate set [1,_rank];
		_employeeToUpdate set [2,_rankName];
		_employeeToUpdate set [3,_salary];
		_employees set [_index,_employeeToUpdate];
		[format["updateCompanyEmployee:%1:%2",_employees,_ID],2] call MySQL_fnc_DBasync;
	};
	case 5: { //remove employee
		private _employees = [format["selectCompanyEmployees:%1",_ID],2] call MySQL_fnc_DBasync;
		private "_index";
		{
			_x params [
				["_oldUID","",[""]]
			];
			if (_oldUID isEqualTo _data) exitWith { //_data is UID
				_index = _forEachIndex
			};
		} forEach _employees;
		_employees deleteAt _index;
		[format["updateCompanyEmployee:%1:%2",_employees,_ID],2] call MySQL_fnc_DBasync;
	};
};