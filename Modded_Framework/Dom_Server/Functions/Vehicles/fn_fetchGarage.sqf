/*
    File: fn_fetchGarage.sqf
    Author: Dom
    Description: Fetches the players garage depending on their faction
*/
params [
    ["_pid","",[""]],
    ["_faction","civ",[""]],
    ["_type","",[""]],
    ["_impounded",false,[false]]
];

if (_pid isEqualTo "" || {_type isEqualTo ""}) exitWith {
    remoteExecCall ["DT_fnc_openGarage",remoteExecutedOwner];
};
_impounded = if (_impounded) then {1} else {0};

private _return = [format["fetchGarage:%1:%2:%3:%4",_pid,_faction,_type,_impounded],2,true] call MySQL_fnc_DBasync;

[_return] remoteExecCall ["DT_fnc_openGarage",remoteExecutedOwner];
