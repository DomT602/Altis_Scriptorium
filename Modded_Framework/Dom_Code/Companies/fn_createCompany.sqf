/*
	File: fn_createCompany.sqf
	Author: Dom
	Description: Creates the company with filled in details
*/
private _name = ctrlText (-1);
private _description = ctrlText (-1);
private _length = count (toArray(_name));
private _chrByte = toArray (_name);
private _descByte = toArray (_description);
private _allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");

if (_length > 48) exitWith {hint "Your company name is too long."};

private _badChar = false;
{
	if !(_x in _allowed) exitWith {_badChar = true};
} forEach _chrByte;
if (_badChar) exitWith {hint "Bad character entered."};

{
	if !(_x in _allowed) exitWith {_badChar = true};
} forEach _descByte;
if (_badChar) exitWith {hint "Bad character entered."};

if (client_cash < 1000) exitWith {hint "You need $1000 to make a Company"};

[getPlayerUID player,name player,_name,_description] remoteExecCall ["DB_fnc_insertCompany",2];

closeDialog 0;