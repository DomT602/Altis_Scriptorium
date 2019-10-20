/*
	File: fn_initModShop.sqf
	Author: Dom
	Description: Initiliases the mod store
*/
params [
	["_vehicle",objNull,[objNull]]
];
if !(_vehicle isKindOf "Car") exitWith {};

createDialog "DT_modShop";
uiNamespace setVariable ["purchase",[[-1,-1],[-1,-1],[-1,-1],[-1,-1],[-1,-1],[-1,-1]]];

private _display = findDisplay 1045;
private _tree = _display displayCtrl 1500;
_tree tvAdd [[],"Paint"];
_tree tvAdd [[],"Material"];
_tree tvAdd [[],"Plate"];
_tree tvAdd [[],"Tint"];
_tree tvAdd [[],"Wheel Colour"];
_tree tvAdd [[],"Parts"];
private _className = typeOf _vehicle;

private _textures = getArray(missionConfigFile >> "Textures" >> "Vehicle" >> _className >> "textures");
private _config = missionConfigFile >> "Modifications" >> "car";
{
	private _index = _forEachIndex;
	{
		_x params ["_name","","_conditions"];
		if ([_conditions] call DT_fnc_conditionChecker) then {
			_tree tvAdd [[_index],_name];
			private _count = (_tree tvCount [_index]) - 1;
			_tree tvSetValue [[_index,_count],_forEachIndex];
		};
	} forEach _x;
} forEach [_textures,getArray(_config >> "rvmats"),getArray(_config >> "plates"),getArray(_config >> "tint"),getArray(_config >> "wheelColour"),getArray(_config >> "proxies")];

["Mod",_vehicle] call DT_fnc_setupCamera;