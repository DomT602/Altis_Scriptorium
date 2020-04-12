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

if (_pid isEqualTo "") exitWith {
	remoteExecCall ["DT_fnc_openGarage",remoteExecutedOwner];
};

private _return = [format["fetchGarage:%1:%2:%3:%4",_pid,_faction,_type,(parseNumber _impounded)],2,true] call MySQL_fnc_DBasync;
{
	_x set [2,(_x select 2) select 0];
} forEach _return;

[_return] remoteExecCall ["DT_fnc_openGarage",remoteExecutedOwner];
