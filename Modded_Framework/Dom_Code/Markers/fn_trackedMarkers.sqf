/*
	File: fn_trackedMarkers.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Displays anything the player has placed a tracker on, called via missionEventHandler "map"
*/

private _markers = [];

{
	if (_x getVariable ["tracked",false]) then {	
		private _marker = createMarkerLocal [format["%1_pMarker",_x],visiblePositionASL _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["GPS Tracker - %1",name _x];
		_markers pushBack [_marker,_x]
	};
} forEach playableUnits;

{  
	if (_x getVariable ["tracked",false]) then {	 
		private _marker = createMarkerLocal [format["%1_vMarker",(random(9999))],visiblePositionASL _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["GPS Tracker - %1",(typeOf _x)];
		_markers pushBack [_marker,_x]
	};
} forEach (allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship");

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
				_mark setMarkerPosLocal (visiblePositionASL _object)
			};
		} forEach _markers;
	},
	0,
	_markers
] call CBA_fnc_addPerFrameHandler;