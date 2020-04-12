/*
	File: fn_updateManage.sqf
	Author: Dom
	Description: Updates from information in the management panel
*/
params [
	["_action","",[""]],
	["_data","",[""]]
];

switch _action do {
	case "updateAnnouncement": {
		[format["updateAnnouncement:%1",_data],1] call MySQL_fnc_DBasync;
		PD_announcement = _data;
		publicVariable "PD_announcement";
	};
	case "updateThreat": {
		[format["updateThreat:%1",_data],1] call MySQL_fnc_DBasync;
		threat_level = _data;
		publicVariable "threat_level";
	};
	case "populatePolice": {
		private _return = ["findAllPolice",2,true] call MySQL_fnc_DBasync;
		[_action,_return] remoteExecCall ["DT_fnc_manage",remoteExecutedOwner];
	};
};