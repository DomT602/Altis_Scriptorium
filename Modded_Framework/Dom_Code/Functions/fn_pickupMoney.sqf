/*
    File: fn_pickupMoney.sqf
    Author: Dom
    Description: Picks up money.
*/

params [
	["_pile",objNull,[objNull]]
];

if (isNull _pile) exitWith {};
private _value = _pile getVariable ["cash",100];
deleteVehicle _pile;
player playMove "AinvPknlMstpSlayWrflDnon";
client_cash = client_cash + _value;
[format["You picked up $%1.",_value],"green"] call DT_fnc_notify;
[0] call DT_fnc_saveStatsPartial;