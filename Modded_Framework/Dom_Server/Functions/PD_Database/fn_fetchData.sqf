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
		[
			{
				warrant_list = ["populateWarrants",2,true] call MySQL_fnc_DBasync;
				publicVariable "warrant_list";
			},
			0,
			0.3
		] call CBA_fnc_waitAndExecute;
	};
	case 1: {
		_name = format ["%1%2%1",'%',_name];
		private _return = [format["fetchArrests:%1",_name],2,true] call MySQL_fnc_DBasync;
		private _return2 = [format["fetchTickets:%1",_name],2,true] call MySQL_fnc_DBasync;
		private _return3 = [format["fetchWarrants:%1",_name],2,true] call MySQL_fnc_DBasync;
		private _return4 = [format["fetchLicenses:%1",_name],2,true] call MySQL_fnc_DBasync;
		[_return,_return2,_return3,_return4] remoteExecCall ["DT_fnc_recieveProfile",remoteExecutedOwner];
	};
};