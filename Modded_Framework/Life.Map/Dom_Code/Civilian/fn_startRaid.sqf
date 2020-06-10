/*
	File: fn_startRaid.sqf
	Author: Dom
	Description: Begins the raid on selected target (only rebel currently)
*/
params [
	["_type","",[""]]
];

if (rebel_nextTime > CBA_missionTime) exitWith {["A raid has recently happened here.","red"] call DT_fnc_notify};

private _position = getPosATL player;
[_position] remoteExecCall ["server_fnc_raidSomewhere",2];