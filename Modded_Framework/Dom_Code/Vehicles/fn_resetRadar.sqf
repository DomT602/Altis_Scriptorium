/*
	File: fn_resetRadar.sqf
	Author: Dom
	Description: Resets the speed radar
*/

params [
	["_vehicle",objNull,[objNull]]
];
if (isNull _vehicle) exitWith {};
if !(_vehicle in ["supported_vehicles"]) exitWith {["This vehicle does not have a radar.","orange"] call DT_fnc_notify};
if (_vehicle getVariable ["radar_inUse",false]) exitWith {["Someone is controlling the radar already.","orange"] call DT_fnc_notify};

private _array = switch (typeOf _vehicle) do {
	case "test_vehicle": {
		[18,19,20] //hidden selections
	};  
};

old_speed = 0; 
{
	_vehicle setObjectTexture [_x,"\PS_Client\Textures\C4_Radar\red\0.paa"];
} forEach _array;