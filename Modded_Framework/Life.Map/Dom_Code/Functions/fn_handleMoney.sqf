/*
	File: fn_handleMoney.sqf
	Author: Dom
	Description: Handles money
*/
params [
	["_var","cash",["cash"]],
	["_value",0,[0]]
];
if (_value isEqualTo 0) exitWith {};

private _oldValue = player getVariable [_var,0];
player setVariable [_var,(_oldValue + _value) max 0,[clientOwner,2]];
if (_value > 100000) then {
	[player,format["Gained unusually large amount of money - $%1",_value]] remoteExecCall ["server_fnc_logAction",2];
};