/*
	File: fn_fetchCompanyBank.sqf
	Author: Dom
	Description: Fetches the companies current bank account
*/
params [
	["_id",-1,[0]]
];
if (_id isEqualTo -1) exitWith {};

private _return = [format["selectCompanyFunds:%1",_ID],2] call MySQL_fnc_DBasync;

_return