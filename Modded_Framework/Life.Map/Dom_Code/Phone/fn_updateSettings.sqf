/*
	File: fn_updateSettings.sqf
	Author: Dom
	Description: Updates the phone settings
*/

private _display = findDisplay 1039;
private _backgrounds = _display displayCtrl 2100;
private _ringtone = _display displayCtrl 2101;
private _slider = _display displayCtrl 1900;

private _background = _backgrounds lbData (lbCurSel _backgrounds);
private _tone = phone_ringtones select (lbCurSel _ringtone) select 1;
private _volume = floor(sliderPosition _slider);

phone_settings = [_background,_tone,_volume];
[call TFAR_fnc_ActiveSWRadio,_volume] call TFAR_fnc_setSwVolume;
["Settings updated.","green"] call DT_fnc_notify;
[2] call DT_fnc_saveStatsPartial;