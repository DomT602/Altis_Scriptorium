/*
	File: fn_prepPage.sqf
	Author: Dom
	Description: Prepares the search profile page on the pc
*/

private _DB = findDisplay -1;
private _arrestBox = _DB displayCtrl -1;
private _ticketBox = _DB displayCtrl -1;

_arrestBox lnbAddColumn 0.1;
_arrestBox lnbAddColumn 0.7;
_arrestBox lnbAddColumn 0.8;
_arrestBox lnbAddColumn 0.9;

_ticketBox lnbAddColumn 0.1;
_ticketBox lnbAddColumn 0.8;
_ticketBox lnbAddColumn 0.9;