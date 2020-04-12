/*
	File: fn_warBOLOLBchange.sqf
	Author: Dom
	Description: Called when selection is changed on warrants/BOLO menu
*/
params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];
if (_selectionPath isEqualTo [] || (count _selectionPath < 2)) exitWith {};

_selectionPath params ["_type"];
private _section = _control tvText [_type];
private _data = parseSimpleArray (_control tvData _selectionPath);
private _display = findDisplay 1019;
private _textArea = _display displayCtrl 1205;

if (_section in ["Search Warrants","Arrest Warrants"]) then {
	_data params ["_id","_name","_crimes","_officer","_notes","_type","_approved","_insertTime"];
	_textArea ctrlSetStructuredText parseText format [
		"Name: %1 <br/>Crimes: %2 <br/>Approved by: %3<br/>Notes: %4<br/>Officer: %5<br/>Input time: %6",
		_name,_crimes,_approved,_notes,_officer,_insertTime
	];
} else {
	if (_section isEqualTo "Vehicle BOLO's") then {
		_data params ["_plate","_notes","_officer"];
		_textArea ctrlSetStructuredText parseText format [
			"Plate: %1<br/>Notes: %2<br/>Officer: %3",
			_plate,_notes,_officer
		];
	} else {
		_data params ["_name","_notes","_officer"];
		_textArea ctrlSetStructuredText parseText format [
			"Name: %1<br/>Notes: %2<br/>Officer: %3",
			_name,_notes,_officer
		];
	};
};
private _pos = [0,0,(ctrlPosition (_display displayCtrl 2300)) select 2,ctrlTextHeight _textArea];
_textArea ctrlSetPosition _pos;
_textArea ctrlCommit 0;