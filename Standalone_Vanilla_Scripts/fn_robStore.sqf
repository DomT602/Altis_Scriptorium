#include "..\..\script_macros.hpp"
/*
	File: fn_robStore.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Robs a store, variables can be customized via the NPC init line
	NPC init line: this addAction["Rob Store",life_fnc_robStore,[totalAttempts,totalTime,totalFunds,'store name']];
    To-do: Place file in core/actions, add to functions.hpp, add to NPC's, define rob_store_cops in config_master (5.0 onwards), before that just replace (LIFE_SETTINGS(getNumber,"rob_store_cops")) with minimum cops you want
*/
params [
	["_target",objNull,[objNull]],
	["_caller",objNull,[objNull]],
	["_ID",0,[0]],
	["_arguments",[10,50,500,""],[[]]]
];

_arguments params [
    ["_attempts",10,[0]],
	["_totalTime",50,[0]],
	["_totalCash",500,[0]],
	["_name","",[""]]
];

if ((west countSide playableUnits) < (LIFE_SETTINGS(getNumber,"rob_store_cops"))) exitWith {hint "Not enough cops on"};
if (currentWeapon player isEqualTo "" || {currentWeapon player isEqualTo "Binocular"} || {currentWeapon player isEqualTo "Rangefinder"} || {!isNull objectParent player}) exitWith {};

private _time = round(_totalTime / _attempts);
private _cash = round(_totalCash / _attempts);
[1,format["Robbery in progress at %1.",_name]] remoteExecCall ["life_fnc_broadcast",west];
_target removeAction _ID;

for "_i" from 0 to 1 step (_attempts - 1) do {
    uiSleep _time;
    if (!alive player) exitWith {
    	_target addAction["Rob Store",life_fnc_robStore,[_attempts,_totalTime,_totalCash,_name]];
    };
    if (player distance _target >= 10 || {!isNull objectParent player} || {currentWeapon player isEqualTo ""} || {currentWeapon player isEqualTo "Binocular"} || {currentWeapon player isEqualTo "Rangefinder"}) exitwith {
        hint "Robbery stopped.";
        uiSleep _time;
        _target addAction["Rob Store",life_fnc_robStore,[_attempts,_totalTime,_totalCash,_name]];
    };
    hint format["You stole %1.",_cash];
    CASH = CASH + _cash;
};

[0] call SOCK_fnc_updatePartial;