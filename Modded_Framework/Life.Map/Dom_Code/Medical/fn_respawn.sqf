/*
	File: fn_respawn.sqf
	Author: Dom
	Description: Called when the player respawns
*/

player setVariable ["hunger",100,true];
player setVariable ["thirst",100,true];
player setVariable ["dead",false,true];
player setVariable ["reviving",nil,true];
player setVariable ["tf_voiceVolume",1,true];
player setVariable ["tf_unable_to_use_radio",false];

player setVariable ["injuries",[0,0,0,0,0,0],true];
player setVariable ["bleeding",[0,0,0,0,0,0],true];
player setVariable ["bodyTemp",37,true];
player setVariable ["blood",5000,true];
player setVariable ["morphine",false,false];
player setVariable ["medRecords",[],true];
if (player getVariable ["restrained",false]) then {
	player setVariable ["restrained",false,true];
};
if !(player getVariable ["evidence",[]] isEqualTo []) then {
	player setVariable ["evidence",nil,true];
};

detach player;
death_camera cameraEffect ["TERMINATE","BACK"];
camDestroy death_camera;
call DT_fnc_resetHUD;

while {stance player != "STAND"} do {
	[player,"AmovPercMstpSnonWnonDnon"] remoteExecCall ["switchMove",-2];
};

client_blockActions = false;

if ((player getVariable ["jailStats",[false,"",0,""]] param [0,0]) isEqualTo 1) exitWith {
	player setVehiclePosition [(getMarkerPos "Jail_Spawn"),[],0,"CAN_COLLIDE"];
	call DT_fnc_jailTimer;
};

call DT_fnc_defaultLoadout;
switch (player getVariable ["faction","civ"]) do {
	case "civ": {player setVehiclePosition [(getMarkerPos "Lakeside_Spawn"),[],0,"CAN_COLLIDE"]};
	case "cop": {player setVehiclePosition [(getMarkerPos "LakesidePD_Spawn"),[],0,"CAN_COLLIDE"]};
	case "medic": {player setVehiclePosition [(getMarkerPos "LakesideEMS_Spawn"),[],0,"CAN_COLLIDE"]};
};