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
lbClear _vehList;

private _name = ["Unknown",_unit] call DT_fnc_findName;
private _textBox = _display displayCtrl 1001;
_textBox ctrlSetText format["Give key to: %1",_name];


{
	private _index = _forEachIndex;
	private _vehType = typeOf _x;
	((getArray (missionConfigFile >> "Textures" >> _vehType >> "textures")) select (_x getVariable ["veh_colour",-1])) params ["veh_colour",""];
	if !(_colour isEqualTo "") then {
		_colour = format["(%1)",_colour];
	};
	private _name = getText(configFile >> "CfgVehicles" >> _vehType >> "displayName");
	private _pic = getText(configFile >> "CfgVehicles" >> _vehType >> "picture");
	_vehList lbAdd format ["%1 (%2)",_name,_colour];
	if (_pic != "pictureStaticObject") then {
		_vehList lbSetPicture [_index,_pic];
	};
} forEach client_keys;