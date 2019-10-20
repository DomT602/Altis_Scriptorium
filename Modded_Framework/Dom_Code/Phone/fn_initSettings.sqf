/*
	File: initSettings.sqf
	Author: Dom
	Description: Initiliases the settings menu
*/

createDialog "DT_settings";
[phone_appOpen] call DT_fnc_updatePhone;
private _display = findDisplay 1039;
private _backgrounds = _display displayCtrl 2100;
private _ringtone = _display displayCtrl 2101;
private _slider = _display displayCtrl 1900;

private _backgroundList = [
	"1","2","Postman Pat","Police","Charger","Riot Police","LOL","Adidas","Space","GTA","Nyan Cat","Constellations","Planets","Galaxy Sloth","CSGO","Space2","Monkey :)","Jack"
];

{
	private _index = _forEachIndex;
	_backgrounds lbAdd _x;
	private _path = format["\Dom_UI\phone\backgrounds\background%1.paa",_index + 1];
	_backgrounds lbSetData [_index,_path];
} forEach _backgroundList;
private _curBG = parseNumber ((phone_settings select 0) select [36,2]);
_backgrounds lbSetCurSel (_curBG - 1);

{
	_x params ["_name","_path"];
	_ringtone lbAdd _name;
	_ringtone lbSetData [_forEachIndex,_path];
} forEach phone_ringtones;

_slider sliderSetRange [0,10];
_slider sliderSetSpeed [1,1];
_slider sliderSetPosition ((call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwVolume);