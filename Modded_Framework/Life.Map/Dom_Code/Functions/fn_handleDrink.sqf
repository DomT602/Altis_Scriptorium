/*
	File: fn_handleDrink.sqf
	Author: Dom
	Description: Handles drinking
*/
params [
	["_item","",[""]],
	["_value",10,[0]]
];
if (_item isEqualTo "") exitWith {};

private _oldValue = player getVariable ["thirst",100];
if !(_oldValue isEqualTo 100) then {
	private _newValue = (_oldValue + _value) min 100;
	player setVariable ["thirst",_newValue,true];
	["You feel more hydrated.","green"] call DT_fnc_notify;
};

["thirst"] call DT_fnc_updateHUDPartial;

if (_item isEqualTo "D_Redgul_i") then {
	["You feel like you can run forever.","blue"] call DT_fnc_notify;
	player enableFatigue false;
	[
		{
			player getVariable ["dead",false]
		},
		{
			player enableFatigue true;
		},
		[],
		180,
		{
			player enableFatigue true;
		}
	] call CBA_fnc_waitUntilAndExecute;
};