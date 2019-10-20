/*
	File: fn_updatePhone.sqf
	Author: Dom
	Description: Updates the phones icons
*/
params [
	["_idd",-1,[0]]
];
private _display = findDisplay _idd;

private _battery = player getVariable ["phoneBattery",100];
private _batteryPic = call {
	if (_battery > 80) exitWith {"\Dom_UI\phone\100bat.paa"};
	if (_battery > 60) exitWith {"\Dom_UI\phone\80bat.paa"};
	if (_battery > 40) exitWith {"\Dom_UI\phone\60bat.paa"};
	if (_battery > 20) exitWith {"\Dom_UI\phone\40bat.paa"};
	if (_battery > 10) exitWith {"\Dom_UI\phone\20bat.paa"};
	if (_battery > 0) exitWith {"\Dom_UI\phone\10bat.paa"};
};

date params ["","","","_hour","_minute"];
if (_minute < 10) then {
	_minute = format["0%1",_minute];
};
if (_hour < 10) then {
	_hour = format["0%1",_hour];
};

(_display displayCtrl 1101) ctrlSetStructuredText parseText (format["%1:%2",_hour,_minute]);
(_display displayCtrl 1100) ctrlSetStructuredText parseText (format["%1%2",_battery,"%"]);
(_display displayCtrl 1202) ctrlSetText _batteryPic;