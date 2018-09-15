/*
	File: fn_addContact.sqf
	Author: Dom
	Description: Adds a contact to the phone
*/

private _display = findDisplay -1;
private _contacts = _display displayCtrl -1;
private _numberBox = _display displayCtrl -1;
private _nameBox = _display displayCtrl -1;

private _number = ctrlText _numberBox;
private _name = ctrlText _nameBox;

if (_number isEqualTo "" || {count _number > 6}) exitWith {["Invalid number.","orange"] call DT_fnc_notify};
if (_name isEqualTo "" || {count _name > 50}) exitWith {["Invalid name.","orange"] call DT_fnc_notify};
phone_contacts pushBack [_number,_name];
_contacts lbAdd (format["%1 (%2)",_name,_number]);

[7] call DT_fnc_saveStatsPartial;