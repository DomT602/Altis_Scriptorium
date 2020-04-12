/*
	File: fn_switchLightbar.sqf
	Author: Dom
	Description: Checks if vehicle supports lightbar and tells server to start them if needed
*/
private _vehicle = objectParent player;
if (isNull _vehicle) exitWith {};
if (((typeOf _vehicle) find "marked") isEqualTo -1) exitWith {["This vehicle does not support lgithbars.","orange"] call DT_fnc_notify};
if (driver _vehicle != player) exitWith {["Only the driver can activate the lightbar.","orange"] call DT_fnc_notify};

if (_vehicle getVariable ["lightbar",false]) then {
	_vehicle setVariable ["lightbar",false,true];
} else {
	_vehicle setVariable ["lightbar",true,true];
	[_vehicle] remoteExec ["server_fnc_startLightbar",2];
};