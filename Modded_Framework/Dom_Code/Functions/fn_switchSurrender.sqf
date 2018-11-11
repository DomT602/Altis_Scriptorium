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
			player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
			 if (player getVariable ["dead",false] || !(isNull objectParent player)) exitWith {client_surrendered = false};
			 uiSleep 0.1;
		};
		while {animationState player == "AmovPercMstpSsurWnonDnon" || animationState player == "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"} do {
			player switchMove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
		};
	};
};