/*
	File: fn_switchSurrender.sqf
	Author: Dom
	Description: Switches surrender state
*/
client_surrendered = !client_surrendered;
if (client_surrendered) then {
	[
		{
			if !(client_surrendered) exitWith {
				[_this select 1] call CBA_fnc_removePerFrameHandler;
				while {animationState player == "AmovPercMstpSsurWnonDnon" || animationState player == "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon"} do {
					[player,"AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"] remoteExecCall ["switchMove",-2];
				};
			};

			if (player getVariable ["dead",false] || !(isNull objectParent player) || (player getVariable ["restrained",false]) || (player getVariable ["tied",false])) exitWith {
				client_surrendered = false;
				[_this select 1] call CBA_fnc_removePerFrameHandler;
			};
			
			player playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
		},
		0.1
	] call CBA_fnc_addPerFrameHandler;
};
true