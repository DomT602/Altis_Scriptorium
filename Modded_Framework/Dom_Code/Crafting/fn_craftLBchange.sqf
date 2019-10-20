/*
	File: fn_craftLBchange.sqf
	Author: Dom
	Description: Called when a different selection is made on crafting menu
*/
params [
	["_control",controlNull,[controlNull]],
	["_selectionPath",[],[[]]]
];
	
private _display = findDisplay 1003;
private _infoBox = _display displayCtrl 1100;
private _countList = _display displayCtrl 2100;
if (count _selectionPath isEqualTo 1) exitWith {ctrlEnable [1600,false]; _infoBox ctrlSetStructuredText parseText ""};

(parseSimpleArray (_control tvData _selectionPath)) params [["_class","",[""]]];
if (_class isEqualTo "") exitWith {	//location is red
	_infoBox ctrlSetStructuredText parseText "Conditions not met";
	ctrlEnable [1600,false];
};

_countList lbSetCurSel 0;