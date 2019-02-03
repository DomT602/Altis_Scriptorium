/*
	File: fn_manageCompany.sqf
	Author: Dom
	Description: Handles various management actions
*/
params [
	["_action","",[""]],
	["_data",0,[0]]
];

switch _action do {
	case "recieveFunds": {
		private _display = findDisplay 1030;
		if (isNull _display) exitWith {};
		uiNamespace setVariable ["comp_funds",_data];
		(_display displayCtrl 1102) ctrlSetStructuredText parseText format["Company funds: $%1",_data];
	};
	case "updateDescription": {
		private _description = ctrlText -1;
		if (count _description > 200) exitWith {["The description cannot be this long.","orange"] call DT_fnc_notify};
		[player getVariable ["company",""],2,_description] remoteExecCall ["DB_fnc_updateCompany",2];
	};
	case "updateEmployee": {

	};
	case "removeEmployee": {
		
	};
};