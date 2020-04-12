/*
	File: fn_endDelivery.sqf
	Author: Dom
	Description: Finishes the delivery
*/
if !(isNull client_carrying) exitWith {["You're not carrying anything.","orange"] call DT_fnc_notify};

client_carrying getVariable ["pack_details",[]] params ["_point","_value","_time"];
private _timeDiff = CBA_missionTime - _time;

detach client_carrying;
deleteVehicle client_carrying;
client_carrying = objNull;
if (_timeDiff > 1800) exitWith {["The delivery took too long, you were not paid.","red"] call DT_fnc_notify};

private _timeMultiplier = call {
	if (_timeDiff < 900) exitWith {1};
	if (_timeDiff < 1200) exitWith {0.9};
	if (_timeDiff < 1500) exitWith {0.75};
	0.5;
};

_value = _value * _timeMultiplier;
["cash",_value] call DT_fnc_handleMoney;
[format["You were paid $%1 for a successful delivery.",_value],"green"] call DT_fnc_notify;