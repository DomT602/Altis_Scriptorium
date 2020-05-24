/*
	File: fn_revived.sqf
	Author: Dom
	Description: Revives the player
*/

closeDialog 0;
death_camera cameraEffect ["TERMINATE","BACK"];
camDestroy death_camera;

["$500 was taken for medical fees.","green"] call DT_fnc_notify;
["bank",-500] call DT_fnc_handleMoney;

player setVariable ["dead",false,true];
player setVariable ["tf_unable_to_use_radio",false];
player setVariable ["tf_voiceVolume",1,true];
player setVariable ["reviving",nil,true];
if (player getVariable ["hunger",100] < 30) then {
	player setVariable ["hunger",30,true];
	["hunger"] call DT_fnc_updateHUDPartial;
};
if (player getVariable ["thirst",100] < 30) then {
	player setVariable ["thirst",30,true];
	["thirst"] call DT_fnc_updateHUDPartial;
};
client_blockActions = false;

[
	{
		while {animationState player isEqualTo "deadstate"} do {
			[player,"AmovPercMstpSnonWnonDnon"] remoteExecCall ["switchMove",-2];
		};
	},
	0,
	0.25
] call CBA_fnc_waitAndExecute;