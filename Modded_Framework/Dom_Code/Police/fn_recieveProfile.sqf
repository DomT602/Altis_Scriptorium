/*
	File: fn_recieveProfile.sqf
	Author: Dom
	Description: Recieves profile from server and displays info
*/
params [
	["_arrests",[],[[]]],
	["_tickets",[],[[]]],
	["_warrants",[],[[]]]
];

if (_warrants isEqualTo []) then {
	ctrlShow [-1,false]; //warrant text
	ctrlShow [-1,false]; //button
};

private _DB = findDisplay -1;
private _arrestBox = _DB displayCtrl -1;
private _ticketBox = _DB displayCtrl -1;
lnbClear _arrestBox;
lnbClear _ticketBox;

{
	_x params ["_crimes","_officer","_time","_bail","_insertTime"];
	_arrestBox lnbAddRow [_insertTime,_crimes,_time,_bail,_officer];
} forEach _arrests;
_arrestBox lnbSetCurSelRow 0;

{
	_x params ["_crimes","_officer","_cost","_insertTime"];
	_ticketBox lnbAddRow [_insertTime,_crimes,_cost,_officer];
} forEach _tickets;

_ticketBox lnbSetCurSelRow 0;

