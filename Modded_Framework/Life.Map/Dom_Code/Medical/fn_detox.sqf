/*
	File: fn_detox.sqf
	Author: Dom
	Description: Detoxifies the target
*/
params [
	["_unit",objNull,[objNull]]
];

["Initiating detox...","blue",3] call DT_fnc_notify;
[
	{
		params ["_unit"];
		_unit setVariable ["intoxication",0,true];
		[_unit,"Detoxified"] call DT_fnc_recordMedical;
		["Detoxification complete.","green"] call DT_fnc_notify;
	},
	_unit,
	3
] call CBA_fnc_waitAndExecute;