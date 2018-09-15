/*
    File: fn_switchDispatch.sqf
    Author: Dom
    Description: Switches player onto dispatcher role
*/
if (player getVariable ["faction","civ"] isEqualTo "civ") exitWith {};
if (player getVariable ["dispatch",false]) exitWith {player setVariable ["dispatch",false,true]; ["You finished working as a dispatcher.","blue"] call DT_fnc_notify};
private _found = false;
{
	if (_x getVariable ["dispatch",false]) then {
		_found = true
	};
} forEach playableUnits;

if (_found) then {
	["Somebody else is currently working as dispatch.","blue"] call DT_fnc_notify;
} else {
	["You signed on as a dispatcher.","green"] call DT_fnc_notify;
	player setVariable ["dispatch",true,true];
};