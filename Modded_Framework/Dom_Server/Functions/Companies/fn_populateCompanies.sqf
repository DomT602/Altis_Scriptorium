/*
	File: fn_populateCompanies.sqf
	Author: Dom
	Description: Populates a list of companies, call everytime a company is made/deleted, and at server start
*/
[
	{
		private _return = ["populateCompanies",2,true] call MySQL_fnc_DBasync;
		server_companies = [];
		{
			_x params ["_name","","","","_employees"];
			private "_uids";
			{
				_x params ["_uid"];
				if (_forEachIndex isEqualTo 0) then {
					_uids = _uid;
				} else {
					_uids = _uids + "|" + _uid;
				};
			} forEach _employees;

			private _list = [format["searchNames:%1",_uids],2,true] call MySQL_fnc_DBasync;

			{
				_x params ["_uid"];
				private _index = _forEachIndex;
				{
					_x params ["_uid2"];
					if (_uid isEqualTo _uid2) exitWith {
						(_employees select _index) pushBack (_x select 1);
					};
				} forEach _list;
			} forEach _employees;
			server_companies pushBack [_name,_employees];
			_x deleteAt 4;
		} forEach _return;

		company_list = _return;
		publicVariable "company_list";
	},
	0,
	0.3
] call CBA_fnc_waitAndExecute;