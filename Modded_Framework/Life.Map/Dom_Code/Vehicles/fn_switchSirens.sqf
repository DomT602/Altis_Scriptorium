/*
	File: fn_switchSirens.sqf
	Author: Dom
	Description: Checks if vehicle supports sirens and tells server to start them if needed
*/
private _vehicle = objectParent player;
if (isNull _vehicle) exitWith {};
if (((typeOf _vehicle) find "marked") isEqualTo -1) exitWith {["This vehicle does not support sirens.","orange"] call DT_fnc_notify};
if (driver _vehicle != player) exitWith {["Only the driver can activate the sirens.","orange"] call DT_fnc_notify};

if (_vehicle getVariable ["siren",false]) then {
	_vehicle setVariable ["siren",false,true];
} else {
	_vehicle setVariable ["siren",true,true];
	[_vehicle,police_sirenType] remoteExec ["server_fnc_startSirens",2];
};