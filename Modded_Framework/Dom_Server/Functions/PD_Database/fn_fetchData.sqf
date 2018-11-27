/*
	File: fn_fetchData.sqf
	Author: Dom
	Description: Fetches data depending on name
*/

params [
	["_type",0,[0]],
	["_name","",[""]]
];
switch _type do {
	case 0: {
		private _return = [format["fetchArrests:%1",_name],2] call MySQL_fnc_DBasync;
		if (_return isEqualTo []) exitWith {remoteExecCall ["DT_fnc_recieveArrests",remoteExecutedOwner]};
		[_return] remoteExecCall ["DT_fnc_recieveArrests",remoteExecutedOwner]; //crimes, officer, time, bail, insert_time
	};
	case 1: {
		private _return = [format["fetchTickets:%1",_name],2] call MySQL_fnc_DBasync;
		if (_return isEqualTo []) exitWith {remoteExecCall ["DT_fnc_recieveTickets",remoteExecutedOwner]};
		[_return] remoteExecCall ["DT_fnc_recieveArrests",remoteExecutedOwner]; //crimes, officer, cost, insert_time
	};
	case 2: {
		private _return = [format["fetchWarrants:%1",_name],2] call MySQL_fnc_DBasync;
		if (_return isEqualTo []) exitWith {remoteExecCall ["DT_fnc_recieveWarrants",remoteExecutedOwner]};
		[_return] remoteExecCall ["DT_fnc_recieveArrests",remoteExecutedOwner]; //id, name, crimes, officer, notes, type, approved, active, insert_time
	};
	case 3: {
		private _return = ["populateWarrants",2] call MySQL_fnc_DBasync;
		warrant_list = _return;
		publicVariable "warrant_list";
	};
	case 4: {
		private _return = [format["fetchArrests:%1",_name],2] call MySQL_fnc_DBasync;
		private _return2 = [format["fetchTickets:%1",_name],2] call MySQL_fnc_DBasync;
		private _return3 = [format["checkWarrants:%1",_name],2] call MySQL_fnc_DBasync;
		[_return,_return2,_return3] remoteExecCall ["DT_fnc_recieveProfile",remoteExecutedOwner];
	};
};