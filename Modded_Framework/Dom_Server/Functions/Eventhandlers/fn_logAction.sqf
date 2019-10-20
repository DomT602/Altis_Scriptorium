/*
	File: fn_logAction.sqf
	Author: Dom
	Description: Logs to DB/server RPT (for cheaters etc)
*/
params [
	["_data",objNull,[objNull,[]]],
	["_text","",[""]],
	["_table","rule",[""]]
];
private _uid = "";
private _name = "";
if (_data isEqualType []) then {
	_uid = _data param [0];
	_name = _data param [1];
} else {
	_name = name _data;
	_uid = getPlayerUID _data;
};

diag_log format["%1 (%2) - %3",_name,_uid,_text];

if (_table != "") then {
	if (_table isEqualTo "rule") then {
		[format["logAction:%1:%2:%3",_uid,_name,_text],1] call MySQL_fnc_DBasync;
	} else {
		[format["logRoutineAction:%1:%2:%3",_uid,_name,_text],1] call MySQL_fnc_DBasync;
	};
};