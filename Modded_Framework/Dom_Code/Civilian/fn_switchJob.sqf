/*
	File: fn_switchJob.sqf
	Author: Dom
	Description: Switches job state
*/
params [
	["_caller",objNull,[objNull]],
	["_job","",[""]]
];

if !(_caller getVariable ["faction","civ"] isEqualTo "civ") exitWith {["You're already on duty.","orange"] call DT_fnc_notify};

private _curJob = _caller getVariable ["job",""];
if (_curJob isEqualTo "") then {
	switch _job do {
		case "tow": {
			_caller setVariable ["job","towtrucker",true];
			["You successfully signed on as a towtrucker.","green"] call DT_fnc_notify;
			["You should help people fix their cars or get out of awkward vehicular situations."] call DT_fnc_notify;
			["Furthermore, you can tow illegal vehicles to Crystal Lake PD where you can then impound them."] call DT_fnc_notify;
		};
		case "lawyer": {
			(nearestObjects[getPosATL _caller,["CAManBase"],5]) params ["",["_nearPlayer",objNull,[objNull]]];
			if (isNull _nearPlayer) exitWith {["You need a Police Officer standing next to you to sign up.","orange"] call DT_fnc_notify};
			if !(_nearPlayer getVariable ["faction","civ"] isEqualTo "cop") exitWith {["You need a Police Officer standing next to you to sign up.","orange"] call DT_fnc_notify};
			_caller setVariable ["job","lawyer",true];
		};
		case "taxi": {
			_caller setVariable ["job","taximan",true];
			["You successfully signed on as a taxi driver.","green"] call DT_fnc_notify;
			["You can use the taxi distance calculator to return the distance a vehicle has driven."] call DT_fnc_notify;
		};
		case "delivery": {
			_caller setVariable ["job","deliveryman",true]
		};
		case "news": {
			_caller setVariable ["job","news reporter",true]
		};
		case "repair": {
			_caller setVariable ["job","repairman",true];
			["You successfully signed on as a repairman.","green"] call DT_fnc_notify;
			["You can repair terrain objects (such as fences)."] call DT_fnc_notify;
		};
		case "security": {
			_caller setVariable ["job","security guard",true];
			["You successfully signed on as a security guard.","green"] call DT_fnc_notify;
			["You will recieve alerts of various crimes and should react accordingly."] call DT_fnc_notify;
		};
	};
} else {
	[format["You left your job as a %1.",_curJob]] call DT_fnc_notify;
	player setVariable ["job",nil,true];
};