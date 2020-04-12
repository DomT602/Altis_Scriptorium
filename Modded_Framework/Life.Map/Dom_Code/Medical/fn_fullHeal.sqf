/*
	File: fn_fullHeal.sqf
	Author: Dom
	Description: Fully heals the player
*/
params [
	["_unit",objNull,[objNull]]
];

private _action = [
	"This treatment will cost $250.",
	"Pay for treatment",
	"Pay",
	"Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
	if ((player getVariable ["cash",0]) < 250) exitWith {["You do not have enough money on you for the treatment.","orange"] call DT_fnc_notify};
	["Please hold still."] call DT_fnc_notify;
	[
		{
			params ["_unit"];
			(player distance _unit) > 7.5 || player getVariable ["dead",false] || client_blockActions
		},
		{
			["Treatment cancelled, you moved too far away from the medic.","orange"] call DT_fnc_notify;
		},
		[_unit],
		5,
		{
			["cash",-250] call DT_fnc_handleMoney;
			if ((player getVariable ["blood",5000]) != 5000) then {
				player setVariable ["blood",5000,true];
			};
			if !((player getVariable ["bleeding",[]]) isEqualTo [0,0,0,0,0,0]) then {
				player setVariable ["bleeding",[0,0,0,0,0,0],true];
			};
			if !((player getVariable ["injuries",[]]) isEqualTo [0,0,0,0,0,0]) then {
				player setVariable ["injuries",[0,0,0,0,0,0],true];
			};
			player setVariable ["bodyTemp",37,true];
			["Your treatment is complete.","green"] call DT_fnc_notify;
		}
	] call CBA_fnc_waitUntilAndExecute;
};