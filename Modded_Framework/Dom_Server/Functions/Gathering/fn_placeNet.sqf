/*
	File: fn_placeNet.sqf
	Author: Dom
	Description: Places the net, creating the vehicle and monitoring it
*/
params [
	["_position",[],[]]
];

_position set [2,0];
private _net = createVehicle ["Fishing_Net",ASLtoAGL _position,[],0,"CAN_COLLIDE"];

server_nets pushBack [_net,CBA_missionTime];

if (fishing_handle isEqualTo -1) then {
	fishing_handle = [
		{
			if (server_nets isEqualTo []) exitWith {
				[_this select 1] call CBA_fnc_removePerFrameHandler;
				fishing_handle = -1;
			};
			private _toDelete = [];
			{
				_x params ["_object","_time"];
				if (isNull _object) then {
					_toDelete pushBack _forEachIndex;
				} else {
					if ((CBA_missionTime - _time) > 45) then {
						if (_object canAdd "Big_Fish") then {
							private _threshold = 2;
							if (count (nearestObjects [_x,["Fishing_Net"],50]) > 1) then {_threshold = 3};
							if (random(5) > _threshold) then {
								_object addItemCargoGlobal [selectRandom ["Fishy","Types"],1];
							};
						};
						(server_nets select _forEachIndex) set [1,CBA_missionTime];
					};
				};
			} forEach server_nets;
			reverse _toDelete;
			{
				server_nets deleteAt _x;
			} forEach _toDelete;
		},
		5
	] call CBA_fnc_addPerFrameHandler;
};