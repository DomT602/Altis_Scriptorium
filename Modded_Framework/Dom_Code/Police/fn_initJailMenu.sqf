/*
    File: fn_initJailMenu.sqf
    Author: Dom
    Description: Opens and populates the menu to adjust players stuff in jail
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit] call DT_fnc_checkPlayer) exitWith {["Invalid target.","red"] call DT_fnc_notify};

private _display = findDisplay 1010;
private _nameBox = _display displayCtrl 1000;
private _name = ["Unknown",_unit] call DT_fnc_findName;

_nameBox ctrlSetStructuredText format["<t align='center'>%1</t>",_name];

_unit getVariable ["jail_details",[]] params ["","_reason","_time","_cell"];

private _hours = 0;
private _minutes = 0;
private _seconds = 0;

if (_time > 60) then {
	if (_time > 3600) then {
		_hours = floor(_time / 3600);
		_time = _time - (_hours * 3600);
		_seconds = _time mod 3600; //remainder seconds
		if (_seconds > 60) then {
			_minutes = floor(_seconds / 60);
			_seconds = _seconds mod 60; //remainder seconds
		};
	};
	_minutes = floor(_time / 60);
	_seconds = _time mod 60; //remainder seconds
};

private _hoursBox = _display displayCtrl 1400;
private _minutesBox = _display displayCtrl 1401;
private _secondsBox = _display displayCtrl 1402;
private _reasonBox = _display displayCtrl 1403;
_hoursBox setText _hours;
_minutesBox setText _minutes;
_secondsBox setText _seconds;
_reasonBox setText _reason;

private _pickaxeButton = _display displayCtrl -1;
if (currentWeapon _unit isEqualTo "Pickaxe") then { //default is to give - menu has true and give
	_pickaxeButton ctrlSetText "Remove Pickaxe";
	_pickaxeButton buttonSetAction "[false] remoteExecCall ['DT_fnc_switchPickaxe',MB_Interaction_Target];";
};