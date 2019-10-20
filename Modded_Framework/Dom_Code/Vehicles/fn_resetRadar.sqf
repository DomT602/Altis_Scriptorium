/*
	File: fn_resetRadar.sqf
	Author: Dom
	Description: Resets the speed radar
*/
params [
	["_vehicle",objNull,[objNull]]
];
if (isNull _vehicle) exitWith {};
if (((typeOf _vehicle) find "marked") isEqualTo -1) exitWith {["This vehicle does not support a radar.","orange"] call DT_fnc_notify};
if (_vehicle getVariable ["radar_inUse",false]) exitWith {["Someone is controlling the radar already.","orange"] call DT_fnc_notify};

private _array = [25,26,27];

old_speed = 0; 
{
	_vehicle setObjectTextureGlobal [_x,"\Dom_Client\Textures\Radar\red0.paa"];
} forEach _array;