/*
    File: fn_alarmMenu.sqf
    Author: Dom
    Description: Brings up the alarm menu
*/
params [
    ["_house",objNull,[objNull]]
];
if (isNull _house) exitWith {};
if !(_house getVariable ["owner",""] isEqualTo getPlayerUID player) exitWith {["This is not your house","orange"]call DT_fnc_notify};

createDialog "DT_alarmMenu";
(_house getVariable ["alarm",[false,false,[]]]) params ["_police","_security","_people"];
private _display = findDisplay -1;
(_display displayCtrl -1) cbSetChecked _police;
(_display displayCtrl -1) cbSetChecked _security;
private _people = [];

