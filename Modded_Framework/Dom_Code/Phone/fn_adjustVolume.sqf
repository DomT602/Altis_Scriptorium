/*
	File: fn_adjustVolume.sqf
	Author: Dom
	Description: Adjusts phone volume
*/
params [
	["_bool",false,[false]]
];

private _volume = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwVolume;
if (_bool) then {
	_volume = (_volume + 1) min 10;
} else {
	_volume = (_volume - 1) max 1;
};
[format["Volume: %1",_volume]] call DT_fnc_notify;
[(call TFAR_fnc_ActiveSWRadio),_volume] call TFAR_fnc_setSwVolume;