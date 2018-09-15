/*
	File: fn_updateContact.sqf
	Author: Dom
	Description: Updates an already saved contact
*/

private _display = findDisplay -1;
private _contacts = _display displayCtrl -1;
private _numberBox = _display displayCtrl -1;
private _nameBox = _display displayCtrl -1;
private _selected = lbCurSel _contacts;
if (_selected isEqualTo -1) exitWith {};

private _number = ctrlText _numberBox;
private _name = ctrlText _nameBox;

if (_number isEqualTo "" || {count _number > 6}) exitWith {["Invalid number.","orange"] call DT_fnc_notify};
if (_name isEqualTo "" || {count _name > 50}) exitWith {["Invalid name.","orange"] call DT_fnc_notify};
phone_contacts set [_selected,[_number,_name]];
call DT_fnc_initContacts;

[7] call DT_fnc_saveStatsPartial;