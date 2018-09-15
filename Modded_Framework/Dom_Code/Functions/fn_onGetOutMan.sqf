/*
    File: fn_onGetOutMan.sqf
    Author: Dom
    Description: Handles hopping out a vehicle
*/
params [
    "",
    "",
    ["_vehicle",objNull,[objNull]]
];

if !(_vehicle isKindOf "Car") exitWith {client_seatbelt = false};

private _time = if !(client_seatbelt) then {
    time + 0.75;
} else {
    time + 1.5;
};
client_seatbelt = false;

while {_time > time} do {
    uiSleep 0.1;
    if !(currentWeapon player isEqualTo "") then {
        player action ["SwitchWeapon",player,player,100];
        [player,"AmovPercMstpSnonWnonDnon"] remoteExecCall ["switchMove",-2];
    };
}; 