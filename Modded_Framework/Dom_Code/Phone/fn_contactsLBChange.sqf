/*
	File: fn_contactsLBChange.sqf
	Author: Dom
	Description: Called when the listbox selection changes
*/

params [
    "",
    ["_index",-1,[0]]
];
if (_index isEqualTo -1) exitWith {};

private _display = findDisplay -1;
private _contacts = _display displayCtrl -1;
private _numberBox = _display displayCtrl -1;
private _nameBox = _display displayCtrl -1;

(phone_contacts select _index) params ["_number","_name"];
_numberBox ctrlSetText _number;
_nameBox ctrlSetText _nameBox;