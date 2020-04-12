/*
	File: fn_switchDispatch.sqf
	Author: Dom
	Description: Switches player onto dispatcher role
*/
if (player getVariable ["faction","civ"] isEqualTo "civ") exitWith {};
if (player getVariable ["dispatch",false]) exitWith {player setVariable ["dispatch",nil,true]; ["You finished working as a dispatcher.","blue"] call DT_fnc_notify};

private _index = playableUnits findIf {_x getVariable ["dispatch",false]};

if (_index isEqualTo -1) then {
	["You signed on as a dispatcher.","green"] call DT_fnc_notify;
	player setVariable ["dispatch",true,true];
} else {
	["Somebody else is currently working as dispatch.","blue"] call DT_fnc_notify;
};