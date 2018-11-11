/*
	File: fn_revived.sqf
	Author: Dom
	Description: Revives the player
*/

["$500 was taken for medical fees.","green"] call DT_fnc_notify;

closeDialog 0;
death_camera cameraEffect ["TERMINATE","BACK"];
camDestroy death_camera;

client_bank = (client_bank - 500) max 0;

while {animationState player isEqualTo "deadstate"} do {
	[player,"AmovPpneMstpSnonWnonDnon"] remoteExecCall ["switchMove",-2];
};

player setVariable ["dead",false,true];
player setVariable ["tf_unable_to_use_radio",false];
player setVariable ["tf_voiceVolume",1,true];
player setVariable ["Reviving",nil,true];
call DT_fnc_saveStatsFull;
client_blockActions = false;