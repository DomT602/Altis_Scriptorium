/*
	File: fn_startSirens.sqf
	Author: Dom
	Description: Starts and monitors the sirens
*/
params [
	["_vehicle",objNull,[objNull]],
	["_type",0,[0]]
];

private _source = createVehicle ["#particlesource",getPosATL _vehicle,[],0,"CAN_COLLIDE"];
_source attachTo [_vehicle,[0,0,0]];
switch _type do {
	case 0: {
		private _sirenTimes = [5.964,5.191,3.668];
		private _i = 0;
		while {_vehicle getVariable ["siren",false] && alive _vehicle} do {
			private _time = time;
			private _sirenTime = _sirenTimes select _i;
			[_source,[format["Whelen_Siren%1",_i],1000,1]] remoteExecCall ["say3D",-2];
			_i = _i + 1;
			if (_i isEqualTo 3) then {_i = 0};
			waitUntil {
				time >= _time + _sirenTime ||
				!(_vehicle getVariable ["siren",false]) ||
				!alive _vehicle
			};
		};
		deleteVehicle _source;
	};
	case 1: {
		private _sirenTimes = [10.402,4.237,4.025];
		private _i = 0;
		while {_vehicle getVariable ["siren",false] && alive _vehicle} do {
			private _time = time;
			private _sirenTime = _sirenTimes select _i;
			[_source,[format["siren%1",_i],1000,1]] remoteExecCall ["say3D",-2];
			_i = _i + 1;
			if (_i isEqualTo 3) then {_i = 0};
			waitUntil {
				time >= _time + _sirenTime ||
				!(_vehicle getVariable ["siren",false]) ||
				!alive _vehicle
			};
		};
		deleteVehicle _source;
	};
	case 2: {
		//ss2000 thing
	};
};