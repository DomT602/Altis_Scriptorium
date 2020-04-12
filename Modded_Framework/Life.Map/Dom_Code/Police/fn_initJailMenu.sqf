/*
	File: fn_initJailMenu.sqf
	Author: Dom
	Description: Opens and populates the menu to adjust players stuff in jail
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit,true] call DT_fnc_checkPlayer) exitWith {};
createDialog "DT_jailMenu";
private _display = findDisplay 1010;
private _nameBox = _display displayCtrl 1100;
private _name = ["Unknown",_unit] call DT_fnc_findName;
_nameBox ctrlSetStructuredText parseText _name;

_unit getVariable ["jailStats",[]] params ["","_reason","_time","_cell"];

private _hours = 0;
private _minutes = 0;
private _seconds = _time;

if (_time > 59) then {
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
_hoursBox ctrlSetText str(_hours);
_minutesBox ctrlSetText str(_minutes);
_secondsBox ctrlSetText str(_seconds);
_reasonBox ctrlSetText _reason;