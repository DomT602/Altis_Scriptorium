/*
	File: fn_deleteContact.sqf
	Author: Dom
	Description: Deletes a contact from phone
*/

private _display = findDisplay -1;
private _contacts = _display displayCtrl -1;
private _selected = lbCurSel _contacts;
if (_selected isEqualTo -1) exitWith {};

phone_contacts deleteAt _selected;
_contacts deleteAt _selected;

[7] call DT_fnc_saveStatsPartial;