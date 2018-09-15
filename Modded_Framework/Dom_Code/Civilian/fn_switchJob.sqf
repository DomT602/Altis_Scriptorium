/*
	File: fn_switchJob.sqf
	Author: Dom
	Description: Switches job state
*/

params [
	["_caller",objNull,[objNull]],
	["_job","",[""]]
];

if !(_caller getVariable ["faction","civ"] isEqualTo "civ") exitWith {["Your already on duty.","orange"] call DT_fnc_notify};

private _curJob = _caller getVariable ["job",""];
if (_curJob isEqualTo "") then {
	switch _job do {
		case "tow": {
			_caller setVariable ["job","towtrucker",true]
		};
		case "lawyer": {
			(nearestObjects[getPosATL _caller,["CAManBase"],5]) params ["","_nearPlayer"];
			if (isNil "_nearPlayer") exitWith {["You need a Police Officer standing next to you to sign up.","orange"] call DT_fnc_notify};
			if !(_nearPlayer getVariable ["faction","civ"] isEqualTo "cop") exitWith {["You need a Police Officer standing next to you to sign up.","orange"] call DT_fnc_notify};
			_caller setVariable ["job","lawyer",true]
		};
		case "taxi": {
			_caller setVariable ["job","taximan",true]
		};
		case "delivery": {
			_caller setVariable ["job","deliveryman",true]
		};
		case "news": {
			_caller setVariable ["job","news_reporter",true]
		};
		case "repair": {
			_caller setVariable ["job","repairman",true]
		};
		case "security": {
			_caller setVariable ["job","security",true]
		};
	};
} else {
	[format["You left your job as a %1.",_curJob]] call DT_fnc_notify;
};