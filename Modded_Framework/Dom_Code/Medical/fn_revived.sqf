/*
	File: fn_revived.sqf
	Author: Dom
	Description: Revives the player
*/
private _reviveCost = 2500;

[format["$%1 was taken for medical fees.",str(_reviveCost)],"green"] call DT_fnc_notify;

closeDialog 0;
death_camera cameraEffect ["TERMINATE","BACK"];
camDestroy death_camera;

if (client_bank > _reviveCost) then {
    client_bank = client_bank - _reviveCost;
} else {
    client_bank = 0;
};

player playMoveNow "AmovPpneMstpSnonWnonDnon";

player setVariable ["dead",false,true];
player setVariable ["tf_unable_to_use_radio",false];
player setVariable ["tf_voiceVolume",1,true];
player setVariable ["Reviving",nil,true];
call DT_fnc_saveStatsFull;
client_blockActions = false;