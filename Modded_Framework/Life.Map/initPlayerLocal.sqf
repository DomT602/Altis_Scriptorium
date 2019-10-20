cutText ["Requesting player data from the server...","BLACK",1];
waitUntil {!(isNil "mod_list")};
private _check = false;
{
	if !(configName _x in mod_list) exitWith {_check = true};
} forEach ("true" configClasses (configFile >> "CfgPatches"));
if (_check) exitWith {
	[player,"Extra PBO detected"] remoteExecCall ["server_fnc_logAction",2];
	["YouSuck",false,5] call BIS_fnc_endMission;
};
mod_list = nil;
call compile preprocessFileLineNumbers "initVars.sqf";
call compile preProcessFileLineNumbers '\Dom_UI\XEH_postClientInit.sqf';
[player] remoteExecCall ["DB_fnc_initialStats",2];