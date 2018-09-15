/*
    File: fn_switchDuty.sqf
    Author: Dom
    Description: Switches player on or off duty
*/
params [
    "",
    "",
    "",
    ["_faction","",[""]]
];

[_faction] call DT_fnc_switchDuty;