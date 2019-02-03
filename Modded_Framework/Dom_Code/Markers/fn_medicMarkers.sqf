/*
	File: fn_medicMarkers.sqf
	Author: Dom
	Description: Whacks down some markers for medics
*/
private _markers = [];
private _medicMarks = [];
private _dead = [];
private _medics = [];

{
	if (_x getVariable ["dead",false]) then {
		_dead pushBack _x
	} else {
		if (_x getVariable ["faction","civ"] isEqualTo "medic" && {"ItemGPS" in assignedItems _x}) then {
			_medics pushBack _x
		};
	};
} forEach playableUnits;

{
	private _marker = createMarkerLocal [format ["%1_marker",_x],visiblePositionASL _x];
	_marker setMarkerColorLocal "ColorIndependent";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal (name _x);
	_medicMarks pushBack [_marker,_x]
} forEach _medics;

{
	private _marker = createMarkerLocal [format ["%1_dead_marker",_x],visiblePositionASL _x];
	_marker setMarkerShapeLocal "ELLIPSE";
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerSizeLocal [20,20];
	_marker setMarkerBrushLocal "SolidFull";
	_marker setMarkerAlphaLocal 0.5;
	//_marker setMarkerTextLocal (name _x);
	_markers pushBack _marker;
} forEach _dead;

[
	{
		params [
			["_arguments",[],[[]]],
			["_handle",-1,[0]]
		];
		_arguments params ["_medics","_dead"];

		if !(visibleMap) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			{
				_x params [
					["_marker","",[""]]
				];
				deleteMarkerLocal _marker;
			} forEach _medics;

			{
				deleteMarkerLocal _x;
			} forEach _dead;
		};

		{
			_x params [
				["_mark","",[""]],
				["_unit",objNull,[objNull]]
			];
			if !(isNull _unit) then {
				_mark setMarkerPosLocal (visiblePositionASL _unit)
			};
		} forEach _medics;
	},
	0,
	[_medicMarks,_markers]
] call CBA_fnc_addPerFrameHandler;