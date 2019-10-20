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
		private _index = server_companies findIf {_x select 0 isEqualTo _name};
		if (_index isEqualTo -1) exitWith {};
		private _employees = (server_companies select _index) select 1;
		private _array = [getPlayerUID _data,0,0,name _data];
		_employees pushBack _array;
		private _deepArray = +_employees;
		{
			_x deleteAt 3;
		} forEach _deepArray;
		[format["updateCompanyEmployee:%1:%2",_deepArray,_name],1] call MySQL_fnc_DBasync;
	};
	case 4: { //update employee rank
		private _index = server_companies findIf {_x select 0 isEqualTo _name};
		if (_index isEqualTo -1) exitWith {};
		_data params ["_uid","_rank"];
		private _employees = (server_companies select _index) select 1;
		private _toUpdate = _employees findIf {_x select 0 isEqualTo _uid};
		private _stuff = _employees select _toUpdate;
		_stuff set [1,_rank];
		_employees set [_toUpdate,_stuff];
		private _deepArray = +_employees;
		{
			_x deleteAt 3;
		} forEach _deepArray;
		[format["updateCompanyEmployee:%1:%2",_deepArray,_name],1] call MySQL_fnc_DBasync;
	};
	case 5: { //remove employee
		private _index = server_companies findIf {_x select 0 isEqualTo _name};
		if (_index isEqualTo -1) exitWith {};
		private _employees = (server_companies select _index) select 1;
		private _toDelete = _employees findIf {_x select 0 isEqualTo _data};
		_employees deleteAt _toDelete;
		if (_employees isEqualTo []) then {
			[_name] call DB_fnc_deleteCompany;
		} else {
			private _deepArray = +_employees;
			{
				_x deleteAt 3;
			} forEach _deepArray;
			[format["updateCompanyEmployee:%1:%2",_deepArray,_name],1] call MySQL_fnc_DBasync;
		};
	};
	case 6: {
		([format["selectCompanyFunds:%1",_name],2] call MySQL_fnc_DBasync) params ["_funds"];
		["recieveFunds",_funds] remoteExecCall ["DT_fnc_manageCompany",remoteExecutedOwner];
	};
	case 7: {
		[format["updateCompanyTasks:%1:%2",_data,_name],1] call MySQL_fnc_DBasync;
		call DB_fnc_populateCompanies;
	};
	case 8: {
		private _index = server_companies findIf {_x select 0 isEqualTo _name};
		if (_index isEqualTo -1) exitWith {};
		private _return = (server_companies select _index) select 1;
		['populateEmployees',_return] remoteExecCall ["DT_fnc_manageCompany",remoteExecutedOwner];
	};
	case 9: { //update employee salary
		private _index = server_companies findIf {_x select 0 isEqualTo _name};
		if (_index isEqualTo -1) exitWith {};
		_data params ["_uid","_salary"];
		private _employees = (server_companies select _index) select 1;
		private _toUpdate = _employees findIf {_x select 0 isEqualTo _uid};
		private _stuff = _employees select _toUpdate;
		_stuff set [2,_salary];
		_employees set [_toUpdate,_stuff];
		private _deepArray = +_employees;
		{
			_x deleteAt 3;
		} forEach _deepArray;
		[format["updateCompanyEmployee:%1:%2",_deepArray,_name],1] call MySQL_fnc_DBasync;
	};
	case 10: {
		([format["selectCompanyFunds:%1",_name],2] call MySQL_fnc_DBasync) params ["_funds"];
		if (_funds >= _data) then {
			_funds = _funds - _data;
			[format["addCompanyFunds:%1:%2",_funds,_name],1] call MySQL_fnc_DBasync;
			["bank",_data] remoteExecCall ["DT_fnc_handleMoney",remoteExecutedOwner];
			[format["You recieved your company paycheck of $%1.",_data],"green"] remoteExecCall ["DT_fnc_notify",remoteExecutedOwner];
		} else {
			[format["You missed your company paycheck of $%1 as there isn't enough money in the company bank.",_data],"red"] remoteExecCall ["DT_fnc_notify",remoteExecutedOwner];
		};
	};
};