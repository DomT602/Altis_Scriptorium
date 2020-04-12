/*
	File: fn_taxiDistance.sqf
	Author: Dom
	Description: Handles distance calculations for a vehicle
*/
params [
	["_vehicle",objNull,[objNull]]
];

if (_vehicle getVariable ["taxi_inUse",false]) then {
	[format["Distance travelled: %1m",round client_distance]] call DT_fnc_notify;
	_vehicle setVariable ["taxi_inUse",false];
} else {
	client_distance = 0;
	_vehicle setVariable ["taxi_inUse",true];
	[
		{
			params ["_arguments"];
			_arguments params ["_vehicle","_oldPos"];
			if !(alive _vehicle || !(_vehicle getVariable ["taxi_inUse",false])) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
			private _pos = getPosASL _vehicle;
			private _aditDistance = _oldPos distance2D _pos;
			_arguments set [1,_pos];
			client_distance = client_distance + _aditDistance;
		},
		1,
		[_vehicle,getPosASL _vehicle]
	] call CBA_fnc_addPerFrameHandler;
};