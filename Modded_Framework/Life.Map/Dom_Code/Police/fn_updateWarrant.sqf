/*
	File: fn_updateWarrant.sqf
	Author: Dom
	Description: Updates the status of a warrant, also can update BOLO's
*/
params [
	["_action","",[""]]
];

private _display = findDisplay 1019;
private _tree = _display displayCtrl 1500;
private _textArea = _display displayCtrl 1201;
private _selectionPath = tvCurSel _tree;
if (count _selectionPath < 2) exitWith {};
_selectionPath params ["_type","_index"];

if (_type in [0,1]) then {
	switch _action do {
		case "approve": {
			if (player getVariable ["copRank",0] < 5 && player getVariable ["dojRank",0] < 2) exitWith {["Only command can approve warrants.","orange"] call DT_fnc_notify};
			private _data = parseSimpleArray (_tree tvData _selectionPath);
			private _approver = _data select 6;
			if !(_approver isEqualTo "") exitWith {["This has already been approved."] call DT_fnc_notify};
			_data set [6,profileName];
			_tree tvSetData [_selectionPath,str(_data)];
			_tree tvSetCurSel _selectionPath;
			[_action,_index,profileName] remoteExecCall ["DB_fnc_updateWarrant",2];
		};
		case "remove": {
			if (player getVariable ["copRank",0] < 5 && player getVariable ["dojRank",0] < 2) exitWith {["Only command can remove warrants.","orange"] call DT_fnc_notify};
			_tree tvDelete _selectionPath;
			_textArea ctrlSetStructuredText parseText "";
			[_action,_index,profileName] remoteExecCall ["DB_fnc_updateWarrant",2];
		};
		case "complete": {
			_tree tvDelete _selectionPath;
			_textArea ctrlSetStructuredText parseText "";
			[_action,_index,profileName] remoteExecCall ["DB_fnc_updateWarrant",2];
		};
	};
} else {
	if (_action isEqualTo "approve") exitWith {["Approving a BOLO does nothing.","orange"] call DT_fnc_notify};
	if (_type isEqualTo 2) then {
		PD_vehBOLOs deleteAt _index;
		publicVariable "PD_vehBOLOs";
		_tree tvDelete _selectionPath;
		_textArea ctrlSetStructuredText parseText "";
	} else {
		PD_otherBOLOs deleteAt _index;
		publicVariable "PD_otherBOLOs";
		_tree tvDelete _selectionPath;
		_textArea ctrlSetStructuredText parseText "";
	};
};