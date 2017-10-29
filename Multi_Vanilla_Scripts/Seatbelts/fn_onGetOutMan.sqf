/*
	File: fn_onGetOutMan.sqf
	Author: Dom (domt602@gmail.com)
	Description: Fires when a unit hops out a car, handles seatbelt functionality
*/
params [
    ["_unit",objNull,[objNull]],
    ["_position","",[""]],
    ["_vehicle",objNull,[objNull]]
];

if !(_vehicle isKindOf "Car") exitWith {life_seatbelt = false};

private _time = if !(life_seatbelt) then {
    time + 0.5;
} else {
    time + 1.5;
};

life_seatbelt = false;

while {_time > time} do {
    uiSleep 0.1;
    if !(currentWeapon player isEqualTo "") then {
        player action ["SwitchWeapon",player,player,100];
        player switchMove "AmovPercMstpSnonWnonDnon"; 
    };
};