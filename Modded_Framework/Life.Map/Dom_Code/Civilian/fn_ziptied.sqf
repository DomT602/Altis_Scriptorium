/*
	File: fn_ziptied.sqf
	Author: Dom
	Description: Monitors the tied people
*/

[player,["tied",50,1]] remoteExecCall ["say3D",-2];
player setVariable ["tf_unable_to_use_radio",true];
client_blockActions = true;

waitUntil {animationState player != "unconscious"};
while {player getVariable ["tied",false]} do {
	if (isNull objectParent player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};

	private _state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(vehicle player isEqualTo _state) || !(player getVariable ["tied",false])};

	if (player getVariable ["dead",false]) exitWith {
		player setVariable ["tied",false,true];
	};

	if (!(isNull objectParent player) && (driver (vehicle player) isEqualTo player)) then {
		player action["eject",vehicle player];
	};
};

if !(player getVariable ["dead",false]) then {
	player playMoveNow "AmovPercMstpSlowWrflDnon_SaluteIn";
	["You are now untied.","green"] call DT_fnc_notify;
	client_blockActions = false;
};