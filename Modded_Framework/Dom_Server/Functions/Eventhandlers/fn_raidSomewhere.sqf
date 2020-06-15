/*
	File: fn_raidSomewhere.sqf
	Author: Dom
	Description: Handles the 'rebel raid' - can be expanded further...
*/
params [
	["_position",[],[[]]],
	["_size",50,[0]],
	["_timer",900,[0]]
];

rebel_nextTime = CBA_missionTime + _timer;
publicVariable "rebel_nextTime";

[
	{
		params ["_position","_size"];
		private _units = playableUnits inAreaArray [_position, _size, _size, 0, true];
		private _copIndex = _units findIf {(_x getVariable ["faction","civ"]) isEqualTo "cop" && {!(_x getVariable ["dead",false])}};
		_copIndex isEqualTo -1
	},
	{
		["The police failed to secure the weapon shipment."] remoteExecCall ["DT_fnc_notify",-2];
	},
	[_position,_size],
	_timer,
	{
		["The police secured the weapon shipment."] remoteExecCall ["DT_fnc_notify",-2];
		rebel_canUse = false;
		publicVariable "rebel_canUse";
		[
			{
				rebel_canUse = true;
				publicVariable "rebel_canUse";
			},
			0,
			1800
		] call CBA_fnc_waitAndExecute;
	}
] call CBA_fnc_waitUntilAndExecute;