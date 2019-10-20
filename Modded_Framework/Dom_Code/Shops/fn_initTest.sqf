/*
	File: fn_initTest.sqf
	Author: Dom
	Description: Initiliases a license test
*/
params [
	["_type","",[""]]
];

(switch _type do {
	case "driver": {["Driving Test",[[11163.815,12765.519,1],[11302.578,12870.497,1],[11250.386,12985.321,1],[10861.577,12771.375,1],[10935.85,12646.253,1]],150,5,"ivory_cv","abs(speed (vehicle player)) > 100"]};
	case "pilot": {};
	case "truck": {};
}) params ["_testName","_markers","_timeLimit","_tolerance","_class","_conditions"];
private _pos = getPosATL player;
private _vehicle = createVehicle [_class,(_markers select 0),[],0];
player moveInDriver _vehicle;
_markers pushBack (_markers select 0);
_vehicle lock 2;

[
	{
		params ["_arguments","_handle"];
		_arguments params ["_testName","_markIndex","_markers","_startTime","_timeLimit","_vehicle","_type","_tolerance","_conditions","_pos"];
		private _currentTarget = _markers select _markIndex;
		if (player getVariable ["dead",false]) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			deleteVehicle _vehicle;
		};
		private _timer = CBA_missionTime - _startTime;
		if (driver _vehicle != player || {!alive _vehicle} || {_timer > _timeLimit} || {call compile _conditions}) exitWith { //{!isOnRoad _vehicle}
			[_handle] call CBA_fnc_removePerFrameHandler;
			["You failed the test.","red"] call DT_fnc_notify;
			_vehicle setVelocity [0,0,0];
			deleteVehicle _vehicle;
			player setPosATL _pos;
		};
		private _distance = player distance _currentTarget;
		if (_distance < _tolerance) then {
			_arguments set [1,_markIndex + 1];
			if (_markIndex isEqualTo (count _markers - 1)) exitWith {
				[_handle] call CBA_fnc_removePerFrameHandler;
				["You passed the test.","green"] call DT_fnc_notify;
				_vehicle setVelocity [0,0,0];
				deleteVehicle _vehicle;
				player setPosATL _pos;
				client_licenses pushBack _type;
				[0] call DT_fnc_saveStatsPartial;
			};
		};
		drawIcon3D ["",[1,1,1,1],_currentTarget,2,2,0,format["%1 - %2m -  %3 seconds remaining",_testName,round _distance,_timeLimit - (round _timer)],1,0.05,"PuristaBold","center",true];
	},
	0,
	[_testName,0,_markers,CBA_missionTime,_timeLimit,_vehicle,_type,_tolerance,_conditions,_pos]
] call CBA_fnc_addPerFrameHandler;