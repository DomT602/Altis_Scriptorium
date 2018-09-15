/*
    File: fn_jailBreak.sqf
    Author: Dom
    Description: Recieves and monitors the bomb state (needs gate in SQM)
*/

params [
	["_time",0,[0]],
	["_gate",objNull,[objNull]]
];

jail_bomb_planted = true;
publicVariable "jail_bomb_planted";

private _bomb = createVehicle ["DemoCharge_Remote_Ammo_Scripted",[0,0,0],[],0,"CAN_COLLIDE"];
_bomb attachTo [_gate,[1,0.8,2.2]];
_bomb setVectorDirAndUp [[0,0,-1],[0,1,0]];
_bomb setVariable ["defused",false,true];
_bomb say3D "bankAlarm";

private _bombTime = time;
waitUntil {_bomb getVariable ["defused",false] || ((time - _bombTime) > _time)};

private _units = ["cop"] call DT_fnc_findPlayers;
if (_bomb getVariable ["defused",false]) then {
	["The bomb at the Jail was successfully defused.","green"] remoteExecCall ["DT_fnc_notify",_units];
} else {
	["The bomb at the Jail has destroyed the gate!","red"] remoteExecCall ["DT_fnc_notify",_units];
	"R_60mm_HE" createVehicle (getPosATL _bomb);
	_gate animate ["door_3_slide", 1];
};
_bomb setVariable ["defused",nil,true];
deleteVehicle _bomb;
jail_bomb_planted = false;
publicVariable "jail_bomb_planted";