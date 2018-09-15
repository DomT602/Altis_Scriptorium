/*
	File: fn_useContact.sqf
	Author: Dom
	Description: Takes selected number and calls/texts it
*/
params [
	["_call",false,[false]]
];

private _display = findDisplay -1;
private _numberBox = _display displayCtrl -1;
private _number = ctrlText _numberBox;

closeDialog 0;
if (_call) then {
	[_number] call DT_fnc_callNumber;
} else {
	[_number] call DT_fnc_initInbox;	
};