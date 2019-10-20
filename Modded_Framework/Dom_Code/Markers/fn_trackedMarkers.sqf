/*
	File: fn_trackedMarkers.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Displays anything the player has placed a tracker on, called via missionEventHandler "map"
*/

private _markers = [];
private _toDelete = [];
{
	_x params ["_object","_text","_time"];
	if (isNull _object || CBA_missionTime > _time) then {
		_toDelete pushBack _forEachIndex;
	} else {
		private _marker = createMarkerLocal [format["trackingMarker%1",_forEachIndex],getPosASL _object];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal _text;
		_markers pushBack [_marker,_object];
	};
} forEach client_trackers;

reverse _toDelete;
{
	client_trackers deleteAt _x;
} forEach _toDelete;
if (_markers isEqualTo []) exitWith {};
	
[
	{
		params [
			["_markers",[],[[]]],
			["_handle",-1,[0]]
		];

		if !(visibleMap) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			{
				_x params [
					["_marker","",[""]]
				];
				deleteMarkerLocal _marker;
			} forEach _markers;
		};

		{
			_x params [
				["_mark","",[""]],
				["_object",objNull,[objNull]]
			];
			if !(isNull _object) then {
				_mark setMarkerPosLocal (getPosASL _object)
			};
		} forEach _markers;
	},
	0,
	_markers
] call CBA_fnc_addPerFrameHandler;