/*
	File: fn_alarmMenu.sqf
	Author: Dom
	Description: Brings up the alarm menu
*/
params [
	["_house",objNull,[objNull]]
];
if (isNull _house) exitWith {};
if !(_house getVariable ["owner",""] isEqualTo getPlayerUID player) exitWith {["This is not your house.","orange"] call DT_fnc_notify};

createDialog "DT_houseManagement";
(_house getVariable ["alarm",[false,false]]) params ["_police","_security"];
private _display = findDisplay 1029;
(_display displayCtrl 2800) cbSetChecked _police;
(_display displayCtrl 2801) cbSetChecked _security;
private _listbox = _display displayCtrl 1500;
{
	_x params ["_uid","_name"];
	_listbox lbAdd format["%1 - %2",_uid,_name];
	_listbox lbSetData [_forEachIndex,_uid];
} forEach (_house getVariable ["houseKeys",[]]);