/*
	File: fn_survivalLoop.sqf
	Author: Dom
	Description: Survival loop
*/

private _start = floor(random 3);
[
	{
		params ["_args"];
		_args params ["_i"];
		_i = _i + 1;
		["battery"] call DT_fnc_survivalEffects;
		if (_i isEqualTo 2) then {
			["thirst"] call DT_fnc_survivalEffects;
			["paycheck"] call DT_fnc_survivalEffects;
		};
		if (_i isEqualTo 4) then {
			["hunger"] call DT_fnc_survivalEffects;
			["paycheck"] call DT_fnc_survivalEffects;
			_i = 0;
		};
		_args set [0,_i];
	},
	150,
	[_start]
] call CBA_fnc_addPerFrameHandler;