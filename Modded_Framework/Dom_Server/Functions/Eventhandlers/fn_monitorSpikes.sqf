/*
	File: fn_monitorSpikes.sqf
	Author: Dom
	Description: Monitors the spikestrip till a car hits it or it is picked up
*/
params [
	["_spikes",objNull,[objNull]]
];

server_spikes pushBack [_spikes,CBA_missionTime];

if (spike_handle isEqualTo -1) then {
	spike_handle = [
		{
			if (server_spikes isEqualTo []) exitWith {
				[_this select 1] call CBA_fnc_removePerFrameHandler;
				spike_handle = -1;
			};
			private _toDelete = [];
			{
				_x params ["_object","_time"];
				private _pos = getPosATL _object;
				(nearestObjects[_pos,["Car"],5]) params [["_nearVeh",objNull]];
				if (alive _nearVeh && {abs (speed _nearVeh) > 3}) then {
					[_nearVeh] remoteExecCall ["DT_fnc_spikeVehicle",_nearVeh];
					deleteVehicle _object;
					_toDelete pushBack _forEachIndex;
				} else {
					if (isNull _object || {(CBA_missionTime - _time) > 900}) then {
						_toDelete pushBack _forEachIndex;
						if !(isNull _object) then {
							deleteVehicle _object;
						};
					};
				};
			} forEach server_spikes;
			reverse _toDelete;
			{
				server_spikes deleteAt _x;
			} forEach _toDelete;
		},
		0
	] call CBA_fnc_addPerFrameHandler;
};