/*
	File: fn_crimCodeChange.sqf
	Author: Dom
	Description: Called when selection is changed on criminal code menu
*/
params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];
private _display = findDisplay 1043;
private _textArea = _display displayCtrl 1205;
if (_selectionPath isEqualTo [] || (count _selectionPath < 2)) exitWith {_textArea ctrlSetStructuredText parseText ""};

(parseSimpleArray (_control tvData _selectionPath)) params ["_penalty",["_details",""]];
private _display = findDisplay 1043;
private _textArea = _display displayCtrl 1205;
private _text = if (_details isEqualTo "") then {_penalty} else {format["%1<br/>Penalty: %2",_details,_penalty]};
_textArea ctrlSetStructuredText parseText _text;