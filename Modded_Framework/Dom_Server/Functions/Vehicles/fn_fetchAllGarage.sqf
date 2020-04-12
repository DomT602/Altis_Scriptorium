/*
	File: fn_fetchAllGarage.sqf
	Author: Dom
	Description: Fetches the players garage depending on their faction
*/
params [
	["_pid","",[""]],
	["_faction","civ",[""]]
];

private _return = [format["fetchAllGarage:%1:%2",_pid,_faction],2,true] call MySQL_fnc_DBasync;
{
	_x set [2,(_x select 2) select 0];
} forEach _return;

[_return] remoteExecCall ["DT_fnc_openTransferMenu",remoteExecutedOwner];