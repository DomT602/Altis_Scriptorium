/*
	File: fn_giveMoney.sqf
	Author: Dom
	Description: Gives selected player money
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit,true] call DT_fnc_checkPlayer) exitWith {};

private _amount = ctrlText ((findDisplay 1012) displayCtrl 1400);
if !([_amount,0] call DT_fnc_checkNumber) exitWith {};
_amount = parseNumber _amount;

if (_amount < (player getVariable ["cash",0])) then {
	closeDialog 0;
	private _name = ["someone",_unit] call DT_fnc_findName;

	[_amount,player] remoteExecCall ["DT_fnc_recieveMoney",_unit];
	["cash",-_amount] call DT_fnc_handleMoney;
	[format["You gave %1 $%2.",_name,_amount],"green"] call DT_fnc_notify;	
} else {
	["You do not have enough money on you.","orange"] call DT_fnc_notify;
};