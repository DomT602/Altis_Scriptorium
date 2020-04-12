/*
	File: fn_medicMarkers.sqf
	Author: Dom
	Description: Whacks down some markers for medics
*/
private _markers = [];
private _dead = [];

{
	if (_x getVariable ["dead",false]) then {
		private _marker = createMarkerLocal [format ["%1_dead_marker",_x],getPosASL _x];
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerSizeLocal [50,50];
		_marker setMarkerBrushLocal "SolidFull";
		_marker setMarkerAlphaLocal 0.5;
		_dead pushBack _marker;
	} else {
		private _faction = _x getVariable ["faction","civ"];
		if (_faction in ["cop","medic"] && {"ItemGPS" in assignedItems _x}) then {
			private _marker = createMarkerLocal [format ["%1_marker",_x],getPosASL _x];
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal (name _x);
			if (_faction isEqualTo "cop") then {
				_marker setMarkerColorLocal "ColorBLUFOR";
			} else {
				_marker setMarkerColorLocal "ColorIndependent";
			};
			_markers pushBack [_marker,_x];
		};
	};
} forEach playableUnits;

[
	{
		params [
			["_arguments",[],[[]]],
			["_handle",-1,[0]]
		];
		_arguments params ["_markers","_dead"];

		if !(visibleMap) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			{
				_x params ["_marker"];
				deleteMarkerLocal _marker;
			} forEach _markers;

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
				_mark setMarkerPosLocal (getPosASL _unit)
			};
		} forEach _markers;
	},
	0,
	[_markers,_dead]
] call CBA_fnc_addPerFrameHandler;