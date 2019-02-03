/*
	File: fn_policeMarkers.sqf
	Author: Dom
	Description: Whacks down some markers for cops
*/
private _markers = [];
private _cops = [];

{
	if (_x getVariable ["faction","civ"] isEqualTo "cop" && {"ItemGPS" in assignedItems _x}) then {
		_cops pushBack _x
	};
} forEach playableUnits;

{
	private _marker = createMarkerLocal [format ["%1_marker",_x],visiblePositionASL _x];
	if (_x getVariable ["dead",false]) then {
		_marker setMarkerColorLocal "ColorRed";
	} else {
		_marker setMarkerColorLocal "ColorBLUFOR";
	};
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal (name _x);
	_markers pushBack [_marker,_x]
} forEach _cops;

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
				["_unit",objNull,[objNull]]
			];
			if !(isNull _unit) then {
				_mark setMarkerPosLocal (visiblePositionASL _unit)
			};
		} forEach _markers;
	},
	0,
	_markers
] call CBA_fnc_addPerFrameHandler;