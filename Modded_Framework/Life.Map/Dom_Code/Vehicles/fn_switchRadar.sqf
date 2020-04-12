/*
	File: fn_switchRadar.sqf
	Author: Dom
	Description: Handles turning on/off the vehicle based speed radar
*/
params [
	["_vehicle",objNull,[objNull]]
];
if (isNull _vehicle) exitWith {};
if (((typeOf _vehicle) find "marked") isEqualTo -1) exitWith {["This vehicle does not support a radar.","orange"] call DT_fnc_notify};
if (_vehicle getVariable ["radar_inUse",false]) exitWith {["Someone is controlling the radar already.","orange"] call DT_fnc_notify};

if (old_speed isEqualTo -1) then {
	_vehicle setVariable ["radar_inUse",true,true];
	old_speed = 0;
	private _patrolArray = [14,15,16];
	private _targetArray = [17,18,19];
	private _lockArray = [20,21,21];
	[
		{
			params [
				["_arguments",[],[[]]],
				["_handle",-1,[0]]
			];
			_arguments params ["_vehicle","_lockArray","_targetArray","_patrolArray"];

			if !(alive _vehicle) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
			if (isNull objectParent player || old_speed isEqualTo -1) exitWith {[_handle] call CBA_fnc_removePerFrameHandler; ["Radar off.","blue"] call DT_fnc_notify};
			private _mySpeed = floor(speed _vehicle);
			if (_mySpeed > 999) exitwith {};

			_mySpeed = (str _mySpeed) splitString "";
			if (count _mySpeed isEqualTo 1) then {
				_mySpeed = ["0","0",(_mySpeed select 0)];
			} else {
				if (count _mySpeed isEqualTo 2) then {
					_mySpeed = ["0",(_mySpeed select 0),(_mySpeed select 1)];
				};
			};

			{
				private _number = format["\Dom_Client\Textures\Radar\green%1.paa",_x];
				_vehicle setObjectTextureGlobal [(_patrolArray select _forEachIndex),_number];
			} forEach _mySpeed;

			private _target = cursorObject;
			if (isNull _target) exitWith {};
			private _targetSpeed = floor(speed _target);

			if (_targetSpeed > old_speed) then {
				old_speed = _targetSpeed;

				private _maxSpeed = (str _targetSpeed) splitString "";
				if (count _maxSpeed isEqualTo 1) then {
					_maxSpeed = ["0","0",(_maxSpeed select 0)];
				} else {
					if (count _maxSpeed isEqualTo 2) then {
						_maxSpeed = ["0",(_maxSpeed select 0),(_maxSpeed select 1)];
					};
				};

				{
					private _number = format["\Dom_Client\Textures\Radar\red%1.paa",_x];
					_vehicle setObjectTextureGlobal [(_lockArray select _forEachIndex),_number];
				} forEach _maxSpeed;
			};

			_targetSpeed = (str _targetSpeed) splitString "";
			if (count _targetSpeed isEqualTo 1) then {
				_targetSpeed = ["0","0",(_targetSpeed select 0)];
			} else {
				if (count _targetSpeed isEqualTo 2) then {
					_targetSpeed = ["0",(_targetSpeed select 0),(_targetSpeed select 1)];
				};
			};

			{
				private _number = format["\Dom_Client\Textures\Radar\yellow%1.paa",_x];
				_vehicle setObjectTextureGlobal [(_targetArray select _forEachIndex),_number];
			} forEach _targetSpeed;
		},
		0,
		[_vehicle,_lockArray,_targetArray,_patrolArray]
	] call CBA_fnc_addPerFrameHandler;
} else {
	_vehicle setVariable ["radar_inUse",false,true];
	old_speed = -1;
};