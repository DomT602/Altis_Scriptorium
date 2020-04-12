/*
	File: fn_startJailbreak.sqf
	Author: Dom
	Description: Does some error checks before starting the jailbreak process
*/
params [
	["_bomb",false,[false]]
];

//if (["cop"] call DT_fnc_countFaction < 7) exitWith {["There are not enough police on.","orange"] call DT_fnc_notify};
if (_bomb) then {
	closeDialog 0;
	//if !("D_Bomb" in (magazines player)) exitWith {["You have no explosives.","orange"] call DT_fnc_notify};
	if (jail_bombPlanted) exitWith {["There is already a bomb planted.","orange"] call DT_fnc_notify};
	if (MB_Interaction_Target animationPhase "door_3_slide" > 0.5) exitWith {["The gate is already open.","orange"] call DT_fnc_notify};
	private _timer = ctrlText ((findDisplay 1047) displayCtrl 1400);
	if !([_timer] call DT_fnc_checkNumber) exitWith {};
	_timer = parseNumber _timer;
	player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	[format["The charge will detonate in %1 seconds!",_timer],"orange"] call DT_fnc_notify;
	//[{player removeItem "D_Bomb"}] call CBA_fnc_execNextFrame;
	[MB_Interaction_Target,_timer] remoteExec ["server_fnc_jailBreak",2];
} else {
	if (jail_deviceSet) exitWith {["There is already a device working.","orange"] call DT_fnc_notify};
	if (player distance (getMarkerPos "Jail") < 25) exitWith {["You need to be closer to the jail.","orange"] call DT_fnc_notify};
	[player] remoteExecCall ["server_fnc_jailBreak",2];
	[{player removeItem "MW_tablet"}] call CBA_fnc_execNextFrame;
};