/*
	File: fn_withdrawCompanyCash.sqf
	Author: Dom
	Description: Withdraws company funds
*/
if (player getVariable ["company_rank",-1] < 3) exitWith {["You are not allowed to withdraw from your companies bank.","red"] call DT_fnc_notify};
private _value = ctrlText -1;
if !([_value,0] call DT_fnc_checkNumber) exitWith {};
_value = parseNumber _value;
//need to get company funds
if (_value > _companyFunds) exitWith {["You don't have that much money on you.","red"] call DT_fnc_notify};

client_cash = client_cash + _value;

[company_ID,1,_value] call DT_fnc_updateCompany;