/*
    File: fn_checkMap.sqf
    Author: DomT602
    Description: Checks if the map is being opened or closed, then puts markers of tracked people.
*/

params [
    ["_mapOpen",false,[false]]
];

if (_mapOpen) then {
    [] spawn life_fnc_trackedMarkers;
};
