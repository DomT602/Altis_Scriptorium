/*
	File: fn_openTransferMenu.sqf
	Author: Dom
	Description: Opens the players garage
*/
params [
	["_vehicles",[],[[]]]
];
if (_vehicles isEqualTo []) exitWith {["You have no vehicles.","orange"] call DT_fnc_notify};
createDialog "DT_transferMenu";
private _display = findDisplay 1044;

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