/*
	File: fn_openGarage.sqf
	Author: Dom
	Description: Opens the players garage
*/
private _display = findDisplay 1011;
if (isNull _display) exitWith {}; //closed menu before recieving data
params [
	["_vehicles",[],[[]]]
];
if (_vehicles isEqualTo []) exitWith {closeDialog 0; ["You have no vehicles in this garage.","orange"] call DT_fnc_notify};

private _control = _display displayCtrl 1500;
{
	private _index = _forEachIndex;
	_x params [
		["_className","Default",[""]],
		["_plate","",[""]],
		["_colour",0,[0]]
	];
	([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
	((getArray(missionConfigFile >> "Textures" >> "Vehicle" >> _className >> "textures")) select _colour) params ["_colour"];
	private _brief = format["%1 - %2 - %3",_name,_plate,_colour];
	_control lbAdd _brief;
	_control lbSetData [_index,_plate];
	_control lbSetPicture [_index,_picture];
} forEach _vehicles;