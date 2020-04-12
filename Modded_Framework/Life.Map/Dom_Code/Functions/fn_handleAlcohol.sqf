/*
	File: fn_handleAlcohol.sqf
	Author: Dom
	Description: Handles drinking of alcohol
*/
params [
	["_item","",[""]],
	["_value",0.1,[0]]
];
if (_item isEqualTo "") exitWith {};

player setVariable ["intoxication",(player getVariable ["intoxication",0]) + _value,true];

if !(client_intoxicated) then {
	client_intoxicated = true;
	"dynamicBlur" ppEffectEnable true;
	private _escHandler = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"];

	[
		{
			params [
				["_escHandler",-1,[0]],
				["_handle",-1,[0]]
			];
			private _intoxication = player getVariable ["intoxication",0];
			if (_intoxication isEqualTo 0) exitWith {
				client_intoxicated = false;
				"dynamicBlur" ppEffectEnable false;
				(findDisplay 46) displayRemoveEventHandler ["keyDown",_escHandler];
				[_handle] call CBA_fnc_removePerFrameHandler;
			};

			"dynamicBlur" ppEffectAdjust [round ((1+(_intoxication-.1))^10)];
			"dynamicBlur" ppEffectCommit 1;
			if (_intoxication > 0.5 && !(animationState player == "unconsciousrevivedefault")) then {
				client_blockActions = true;
				player setUnconscious true;
				[
					{
						player getVariable ["intoxication",0] < 0.45
					},
					{
						[
							{
								player setUnconscious false;
								player playMoveNow "UnconsciousOutProne";
								client_blockActions = false;
							},
							0,
							10
						] call CBA_fnc_waitAndExecute;
					}
				] call CBA_fnc_waitUntilAndExecute;
			};
		},
		5,
		_escHandler
	] call CBA_fnc_addPerFrameHandler;

	[
		{
			private _intoxication = player getVariable ["intoxication",0];
			player setVariable ["intoxication",(_intoxication - 0.02) max 0,true];
			if (_intoxication < 0.03) exitWith {
				["You are completely sober.","green"] call DT_fnc_notify;
				[_this select 1] call CBA_fnc_removePerFrameHandler;
			};
		},
		30
	] call CBA_fnc_addPerFrameHandler;
};