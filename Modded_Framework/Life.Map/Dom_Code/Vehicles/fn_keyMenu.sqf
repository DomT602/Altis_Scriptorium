/*
	File: fn_keyMenu.sqf
	Author: Dom
	Description: Opens the key menu
*/
params [
	["_unit",objNull,[objNull]]
];

client_keys = client_keys - [objNull];
if (client_keys isEqualTo []) exitWith {["You have no keys.","orange"] call DT_fnc_notify};  

createDialog "DT_keyMenu";
private _display = findDisplay 1014;
private _vehList = _display displayCtrl 1500;

private _name = ["Unknown",_unit] call DT_fnc_findName;
private _textBox = _display displayCtrl 1100;
_textBox ctrlSetStructuredText parseText format["Give key to: %1",_name];

{
	private _vehType = typeOf _x;
	private _name = getText(configFile >> "CfgVehicles" >> _vehType >> "displayName");
	if (_x isKindOf "House_F") then {
		_vehList lbAdd _name;
	} else {
		((getArray (missionConfigFile >> "Textures" >> "Vehicle" >> _vehType >> "textures")) select (_x getVariable ["customisation",[0]] select 0)) params ["_colour",""];
		_vehList lbAdd format ["%1 - %2 - %3",_name,_x getVariable ["plate",""],_colour];
	};
	private _pic = getText(configFile >> "CfgVehicles" >> _vehType >> "picture");
	if (_pic != "pictureStaticObject") then {
		_vehList lbSetPicture [_forEachIndex,_pic];
	};
} forEach client_keys;