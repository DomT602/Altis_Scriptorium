/*
	File: fn_startJailbreak.sqf
	Author: Dom
	Description: Does some error checks before starting the jailbreak process
*/
params [
	["_bomb",false,[false]]
];

if (_bomb) then {
	//if !("D_Bomb" in (magazines player)) exitWith {["You have no explosives.","orange"] call DT_fnc_notify};
	if (jail_bombPlanted) exitWith {["There is already a bomb planted.","orange"] call DT_fnc_notify};
	if (MB_Interaction_Target animationPhase "door_3_slide" > 0.5) exitWith {["The gate is already open.","orange"] call DT_fnc_notify};
	//if (["cop"] call DT_fnc_countFaction < 7) exitWith {["There are not enough police on.","orange"] call DT_fnc_notify};
	player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	private _bomb = createVehicle ["DemoCharge_Remote_Ammo_Scripted",[9784.57,9648.58,1.40897],[],0,"CAN_COLLIDE"];
	_bomb setVectorDirAndUp [[0,0,-1],[-7,1,0]];
	[MB_Interaction_Target,30,_bomb] remoteExec ["server_fnc_jailBreak",2];
	//player removeMagazine "D_Bomb";
} else {
	if (jail_deviceSet) exitWith {["There is already a device working.","orange"] call DT_fnc_notify};
	//if (["cop"] call DT_fnc_countFaction < 7) exitWith {["There are not enough police on.","orange"] call DT_fnc_notify};
	if (player distance (getMarkerPos "Jail") < 25) exitWith {["You need to be closer to the jail.","orange"] call DT_fnc_notify};
	[player] remoteExecCall ["server_fnc_jailBreak",2];
	player removeMagazine "MW_tablet";
};