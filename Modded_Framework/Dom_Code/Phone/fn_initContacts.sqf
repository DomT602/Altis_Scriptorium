/*
	File: fn_initContacts.sqf
	Author: Dom
	Description: Initiliases the contacts menu
*/

private _display = findDisplay -1;
private _contacts = _display displayCtrl -1;
lbClear _contacts;

{
	_x params [
		["_number","",[""]],
		["_name","",[""]]
	];
	private _text = format["%1 (%2)",_name,_number];
	_contacts lbAdd _text;
} forEach phone_contacts;

_contacts lbSetCurSel 0;