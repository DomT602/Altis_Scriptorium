/*
	File: fn_survivalLoop.sqf
	Author: Dom
	Description: Survival loop via a CBA PFH
*/

[
	{
		client_survivalStage = client_survivalStage + 1;
		if (client_survivalStage in [2,4]) exitWith {
			["battery"] call DT_fnc_survivalEffects;
			if (client_survivalStage isEqualTo 4) then {
				["hunger"] call DT_fnc_survivalEffects;
				["paycheck"] call DT_fnc_survivalEffects;
				client_survivalStage = 0;
			};
		};
		if (client_survivalStage isEqualTo 3) exitWith {
			["thirst"] call DT_fnc_survivalEffects;
		};
	},
	150
] call CBA_fnc_addPerFrameHandler;