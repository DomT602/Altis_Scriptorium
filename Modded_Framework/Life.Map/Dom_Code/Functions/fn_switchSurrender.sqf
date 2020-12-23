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
				player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"
			};

			if (player getVariable ["dead",false] || !(isNull objectParent player) || (player getVariable ["restrained",false]) || (player getVariable ["tied",false])) exitWith {
				client_surrendered = false;
				[_this select 1] call CBA_fnc_removePerFrameHandler;
			};
			if (animationState player != "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon") then {
				player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
			};
		},
		0.01
	] call CBA_fnc_addPerFrameHandler;
};
true