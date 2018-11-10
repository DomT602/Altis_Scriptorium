/*
	File: fn_survivalLoop.sqf
	Author: Dom
	Description: Survival loop
*/

[
	{
		["battery"] call DT_fnc_survivalEffects;
		[
			{
				["thirst"] call DT_fnc_survivalEffects;
				["battery"] call DT_fnc_survivalEffects;
				[
					{
						["battery"] call DT_fnc_survivalEffects;
						[
							{
								["hunger"] call DT_fnc_survivalEffects;
								["paycheck"] call DT_fnc_survivalEffects;
								["battery"] call DT_fnc_survivalEffects;
								[4] call DT_fnc_saveStatsPartial;
								call DT_fnc_survivalLoop;
							},
							[],
							150
						] call CBA_fnc_waitAndExecute;
					},
					[],
					150
				] call CBA_fnc_waitAndExecute;
			},
			[],
			150
		] call CBA_fnc_waitAndExecute;
	},
	[],
	150
] call CBA_fnc_waitAndExecute;