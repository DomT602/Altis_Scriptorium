/*
	File: fn_policeMarkers.sqf
	Author: Dom
	Description: Whacks down some markers for cops
*/
private _markers = [];

{
	private _faction = _x getVariable ["faction","civ"];
	if (_faction in ["cop","medic"] && {"ItemGPS" in assignedItems _x}) then {
		private _marker = createMarkerLocal [format ["%1_marker",_x],getPosASL _x];
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal (name _x);
		if (_x getVariable ["dead",false]) then {
			_marker setMarkerColorLocal "ColorRed";
		} else {
			if (_faction isEqualTo "cop") then {
				_marker setMarkerColorLocal "ColorBLUFOR";
			} else {
				_marker setMarkerColorLocal "ColorIndependent";
			};
		};
		_markers pushBack [_marker,_x];
	};
} forEach playableUnits;

[
	{
		params [
			["_markers",[],[[]]],
			["_handle",-1,[0]]
		];

		if !(visibleMap) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			{
				_x params ["_marker"];
				deleteMarkerLocal _marker;
			} forEach _markers;
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
	_markers
] call CBA_fnc_addPerFrameHandler;