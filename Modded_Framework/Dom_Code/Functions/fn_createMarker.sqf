/*
	File: fn_createMarker.sqf
	Author: Dom
	Description: Creates a local marker on players map e.g [player,"Mil_objective","PANIC","ColorRed",60] remoteExecCall ["DT_fnc_createMarker",_cops];
*/

params [
	["_position",[],[[],objNull]],
	["_type","",[""]],
	["_text","",[""]],
	["_colour","",[""]],
	["_time",60,[60]]
];

if (_position isEqualType objNull) then {_position = getPosASL _position};
private _mark = createMarkerLocal [format["%1",round(random 1000)],_position];
_mark setMarkerTypeLocal _type;
_mark setMarkerTextLocal _text;
_mark setMarkerColorLocal _colour;
if !(_time isEqualTo -1) then {
	[
		{
			params ["_mark"];
			deleteMarkerLocal _mark;
		},
		_mark,
		_time
	] call CBA_fnc_waitAndExecute;
};