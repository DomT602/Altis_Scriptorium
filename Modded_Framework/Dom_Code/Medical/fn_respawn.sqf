/*
	File: fn_respawn.sqf
	Author: Dom
	Description: Called when the player respawns
*/

client_cash = 0;

player setVariable ["hunger",100,true];
player setVariable ["thirst",100,true];
player setVariable ["dead",false,true];
player setVariable ["Reviving",nil,true];
player setVariable ["tf_voiceVolume",1,true];
player setVariable ["tf_unable_to_use_radio",false];

player setVariable ["head",0,true];
player setVariable ["torso",0,true];
player setVariable ["legs",0,true];
player setVariable ["arms",0,true];
player setVariable ["bleeding",0,true];
player setVariable ["blood",5000,true];
player setVariable ["morphine",false,true];
player setVariable ["medRecords",[],true];

death_camera cameraEffect ["TERMINATE","BACK"];
camDestroy death_camera;

while {animationState player isEqualTo "deadstate"} do {
	[player,"AmovPercMstpSnonWnonDnon"] remoteExecCall ["switchMove",-2];
};

client_blockActions = false;

(player getVariable ["jail_details",[0,"",0,""]]) params ["_arrested","","_time"];
if (_arrested isEqualTo 1) exitWith {
	player setVehiclePosition [(getMarkerPos "Jail_Spawn"),[],0,"CAN_COLLIDE"];
    [_time] spawn DT_fnc_jailTimer;
    call DT_fnc_saveStatsFull;
};

call DT_fnc_defaultLoadout;
switch (player getVariable ["faction","civ"]) do {
	case "civ": {player setVehiclePosition [(getMarkerPos "Lakeside_Spawn"),[],0,"CAN_COLLIDE"]};
	case "cop": {player setVehiclePosition [(getMarkerPos "LakesidePD_Spawn"),[],0,"CAN_COLLIDE"]};
	case "medic": {player setVehiclePosition [(getMarkerPos "LakesideEMS_Spawn"),[],0,"CAN_COLLIDE"]};
};
call DT_fnc_saveStatsFull;