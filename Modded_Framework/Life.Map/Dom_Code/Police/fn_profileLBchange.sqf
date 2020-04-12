/*
	File: fn_profileLBchange.sqf
	Author: Dom
	Description: Called when selection is changed
*/
params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];

private _display = findDisplay 1017;
private _textArea = _display displayCtrl 1100;
_selectionPath params [["_type",-1]];
if (_selectionPath isEqualTo [] || (count _selectionPath < 2) || _type isEqualTo 3) exitWith {_textArea ctrlSetStructuredText parseText ""};

private _data = parseSimpleArray (_control tvData _selectionPath);

switch _type do {
	case 0: {
		_data params ["_name","_crimes","_officer","_time","_bail","_notes","_insertTime"];
		_textArea ctrlSetStructuredText parseText format [
			"Crimes: %1 <br/>Arresting Officer: %2 <br/>Total time: %3<br/>Bail amount: %4<br/>Input time: %5<br/>Notes: %6",
			_crimes,_officer,_time,_bail,_insertTime,_notes
		];
	};
	case 1: {
		_data params ["_name","_crimes","_officer","_cost","_insertTime"];
		_textArea ctrlSetStructuredText parseText format [
			"Crimes: %1 <br/>Arresting Officer: %2 <br/>Ticket price: %3<br/>Input time: %4",
			_crimes,_officer,_cost,_insertTime
		];
	};
	case 2: {
		_data params ["_id","_name","_crimes","_officer","_notes","_type","_approved","_active","_completedBy","_insertTime"];
		_textArea ctrlSetStructuredText parseText format [
			"Crimes: %1 <br/>Authorising Officer: %2 <br/>Type: %3<br/>Approved by: %4<br/>Status: %5<br/>Notes: %6<br/>Input time: %7<br/>Completed by: %8",
			_crimes,_officer,_type,_approved,_active,_notes,_insertTime,_completedBy
		];
	};
};
private _pos = [0,0,(ctrlPosition (_display displayCtrl 2300)) select 2,ctrlTextHeight _textArea];
_textArea ctrlSetPosition _pos;
_textArea ctrlCommit 0;