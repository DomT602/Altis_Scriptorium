/*
	File: fn_handleFood.sqf
	Author: Dom
	Description: Handles eating food
*/
params [
	["_item","",[""]],
	["_value",10,[0]]
];
if (_item isEqualTo "") exitWith {};

private _oldValue = player getVariable ["hunger",100];
if !(_oldValue isEqualTo 100) then {
	private _newValue = (_oldValue + _value) min 100;
	player setVariable ["hunger",_newValue,true];
	["You feel less hungry.","green"] call DT_fnc_notify;
};

["hunger"] call DT_fnc_updateHUDPartial;
[_value] call DT_fnc_recieveBlood;
if (player getVariable ["bodyTemp",37] < 37) then {
	[(_value / 100)] call DT_fnc_recieveHeat;
};