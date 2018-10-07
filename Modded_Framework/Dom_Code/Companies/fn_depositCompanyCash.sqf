/*
	File: fn_depositCompanyCash.sqf
	Author: Dom
	Description: Deposits company funds
*/
private _value = parseNumber(ctrlText -1);

if (_value > 999999 || {_value <= 0}) exitWith {["Invalid number.","red"] call DT_fnc_notify};
if (_value > client_cash) exitWith {["You don't have that much money on you.","red"] call DT_fnc_notify};

client_cash = client_cash - _value;

[company_ID,0,_value] call DT_fnc_updateCompany;