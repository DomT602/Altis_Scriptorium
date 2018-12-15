/*
	File: fn_depositCompanyCash.sqf
	Author: Dom
	Description: Deposits company funds
*/
private _value = ctrlText -1;
if !([_value,0] call DT_fnc_checkNumber) exitWith {};
_value = parseNumber _value;

if (_value > client_cash) exitWith {["You don't have that much money on you.","red"] call DT_fnc_notify};

client_cash = client_cash - _value;

[company_ID,0,_value] call DT_fnc_updateCompany;