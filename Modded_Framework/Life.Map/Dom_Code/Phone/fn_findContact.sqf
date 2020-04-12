/*
	File: fn_findContact.sqf
	Author: Dom
	Description: Finds a contact's name
*/
params [
	["_number","",[""]]
];

private _name = "";
private _index = phone_contacts findIf {_x select 0 isEqualTo _number};

if (_index != -1) then {
	_name = (phone_contacts select _index) select 1;
};
_name;