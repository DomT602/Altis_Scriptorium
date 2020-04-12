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
["cash",_value] call DT_fnc_handleMoney;
[format["You picked up $%1.",_value],"green"] call DT_fnc_notify;