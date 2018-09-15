/*
	File: fn_progressBar.sqf
	Author: Dom
	Description: Initiates the progress bar
*/

params [
	["_title","",[""]],
	["_totalTime",0,[0]],
	["_animation","",["",[]]], //either the anim, or array in format [kneel/standing,prone]
	["_conditions","",[""]],
	["_onComplete",{},[{}]],
	["_onFail",{},[{}]],
	["_args",[],[]]
];

closeDialog 0;
createDialog "DT_Progress";

private _ui = uiNamespace getVariable ["Progress_Bar",controlNull];
(_ui displayCtrl 1001) ctrlSetStructuredText parseText format ["<t align='center'>%1</t>",_title];
client_blockActions = true;

[
	{
		params ["_arguments","_handle"];
		_arguments params [
			["_conditions","",[""]],
			["_totalTime",0,[0]],
			["_animation","",[""]],
			["_startTime",0,[0]],
			["_onComplete",{},[{}]],
			["_onFail",{},[{}]],
			["_args",[],[[]]]
		];

		private _elapsedTime = CBA_missionTime - _startTime;
		private _state = -1;

		if (isNull (uiNamespace getVariable ["Progress_Bar",controlNull])) then {
			_state = 1;
		} else {
			if (player getVariable ["dead",false]) then {
				_state = 2;
			} else {
				if !(call compile _conditions) then {
					_state = 3;
				} else {
					if (_elapsedTime >= _totalTime) then {
						_state = 0;
					} else {
						if (_animation isEqualType "") then {
							if (_animation isEqualTo "") exitWith {};
							if (animationState player != _animation) then {
								player playMove _animation;
							};
						} else {
							if (stance player isEqualTo "PRONE") then {
								if (animationState player != _animation) then {
									player playMove (_animation select 1);
								};
							} else {
								if (stance player isEqualTo "UNDEFINED") exitWith {};
								if (animationState player != _animation) then {
									player playMove (_animation select 0);
								};
							};
						};
					};
				};
			};
		};

		if !(_state isEqualTo -1) then {
			if (!isNull (uiNamespace getVariable ["Progress_Bar",controlNull])) then {
				closeDialog 0;
			};

			[_handle] call CBA_fnc_removePerFrameHandler;

			if (_state isEqualTo 0) then {
				_args call _onComplete;
			} else {
				[_state] call _onFail;
			};
			client_blockActions = false;
		} else {
			((uiNamespace getVariable "Progress_Bar") displayCtrl 1000) progressSetPosition (_elapsedTime / _totalTime);
		};
	},
	0,
	[_conditions,_totalTime,_animation,CBA_missionTime,_onComplete,_onFail,_args]
] call CBA_fnc_addPerFrameHandler;