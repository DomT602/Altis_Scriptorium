/*
	File: fn_handleKeys.sqf
	Author: Dom
	Description: Handles keys so on rejoining players get keys reassigned
*/
params [
	["_uid","",[""]],
	["_input",objNull,[objNull]]
];

if (_uid isEqualTo "" || isNull _input || _input isKindOf "House") exitWith {};

private _array = missionNamespace getVariable [format["keys_%1",_uid],[]];
_array pushBack _input;
_array = _array - [objNull];
missionNamespace setVariable [format["keys_%1",_uid],_array];