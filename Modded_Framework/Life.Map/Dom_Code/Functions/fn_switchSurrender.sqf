/*
	File: fn_switchSurrender.sqf
	Author: Dom
	Description: Switches surrender state
*/

if (client_surrendered) then {
	client_surrendered = false;
	true;
} else {
	client_surrendered = true;
	[] spawn {
		while {client_surrendered} do {
			player playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
			if (player getVariable ["dead",false] || !(isNull objectParent player) || (player getVariable ["restrained",false]) || (player getVariable ["tied",false])) exitWith {client_surrendered = false};
			uiSleep 0.1;
		};
		while {animationState player == "AmovPercMstpSsurWnonDnon" || animationState player == "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"} do {
			[player,"AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"] remoteExecCall ["switchMove",-2];
		};
	};
};