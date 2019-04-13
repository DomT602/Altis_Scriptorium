/*
    File: fn_setTexture.sqf
    Author: Dom
    Description: Sets the texture on selected vehicle
*/
params [
    ["_vehicle",objNull,[objNull]],
    ["_index",-1,[0]]
];
if (isNull _vehicle) exitWith {};

private _className = typeOf _vehicle;
_vehicle setVariable ["veh_colour",_index,true];

if !(isClass (missionConfigFile >> "Textures" >> "Vehicle" >> _className)) exitWith {
    diag_log format["Vehicle colour error: %1",_className];
    _className = "Default";
};

private _textures = (getArray(missionConfigFile >> "Textures" >> "Vehicle" >> _className >> "textures")) select _index param [1,[]];

{
	if (isServer) then {
		_vehicle setObjectTextureGlobal [_forEachIndex,_x];
	} else {
		_vehicle setObjectTexture [_forEachIndex,_x];
	};
} forEach _textures;