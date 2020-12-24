/*
	File: fn_jailTimer.sqf
	Author: Dom
	Description: Sets up the jail timer
*/
params [
	["_initial",false,[true]]
];
if (_initial) then {
	if (vest player != "") then {removeVest player};
	if (backpack player != "") then {removeBackpack player};
};
[
	{
		private _variable = player getVariable ["jailStats",[]];
		private _time = _variable param [2,0,[0]];
		_time = _time - 1;
		private _HUD = uiNamespace getVariable ["DT_HUD",displayNull];

		if (_time isEqualTo 0 || (player distance (getMarkerPos "Jail") > 110)) exitWith {
			[_this select 1] call CBA_fnc_removePerFrameHandler;
			private _cellRef = _variable select 3;
			jail_cellsUsed deleteAt (jail_cellsUsed find _cellRef);
			publicVariable jail_cellsUsed;
			player setVariable ["jailStats",[false,"",0,""],true];
			(_HUD displayCtrl 1514) ctrlSetStructuredText parseText "";
			(_HUD displayCtrl 1513) ctrlSetStructuredText parseText "";
			if (_time isEqualTo 0) then {
				["You were released from the jail.","green"] call DT_fnc_notify;
				player setPosATL (getMarkerPos "jail_release");
				player forceAddUniform "Released_Uniform";
			} else {
				["You escaped from the jail.","red"] call DT_fnc_notify;
			};
		};
		private _hours = 0;
		private _minutes = 0;
		private _seconds = _time;

		if (_time > 59) then {
			if (_time > 3600) then {
				_hours = floor(_time / 3600);
				_time = _time - (_hours * 3600);
				_seconds = _time mod 3600;
				if (_seconds > 60) then {
					_minutes = floor(_seconds / 60);
					_seconds = _seconds mod 60;
				};
			};
			_minutes = floor(_time / 60);
			_seconds = _time mod 60;
		};
		
		(_HUD displayCtrl 1514) ctrlSetStructuredText parseText (_variable param [1,"",[""]]);
		(_HUD displayCtrl 1513) ctrlSetStructuredText parseText format["%1-%2-%3",_hours,_minutes,_seconds];
		_variable set [2,_time];
		player setVariable ["jailStats",_variable,true];
	},
	1
] call CBA_fnc_addPerFrameHandler;