/*
	File: fn_calculateTemperature.sqf
	Author: Dom
	Description: Calculates any temperature change
*/
//normal body temp: 37, 39 too high, 35 too low
private _bodyTemp = player getVariable ["bodyTemp",37];
if (player getVariable ["dead",false]) exitWith {
	_bodyTemp = _bodyTemp - 0.25;
	player setVariable ["bodyTemp",_bodyTemp,true];
};

private _heightEffect = 0;
private _zPos = (getPosASL player) select 2;

if (underwater player) then {
	_heightEffect = if (uniform player in ["U_B_Wetsuit","D_Police_Uni_Diving"]) then {_zPos / 25} else {_zPos / 10};
} else {
	_heightEffect = _zPos / 500;	
};

private _aditModifiers = 0;
if (uniform player isEqualTo "") then {
	_aditModifiers = -2;
};

private _baseTemp = ((current_temperature + 20) min 38) max 36;
private _temp = _baseTemp - (abs (parseNumber (_heightEffect toFixed 2))) + _aditModifiers;
if (abs(_bodyTemp - _temp) < 0.5) exitWith {};

if (_temp >= _bodyTemp) then {
	_bodyTemp = _bodyTemp + ((_temp / 50) min 0.1);
} else {
	_bodyTemp = _bodyTemp - ((_temp / 100) min 0.1);
};
if (_bodyTemp < 35) then {
	["You are suffering from hypothermia.","red"] call DT_fnc_notify;
	player setAnimSpeedCoef (1 - (abs(35 - _bodyTemp) * 0.05));
} else {
	if (_bodyTemp > 39) then {
		["You are suffering from heat exhaustion.","red"] call DT_fnc_notify;
		player setAnimSpeedCoef (1 - (abs(39 - _bodyTemp) * 0.05));
	} else {
		if (getAnimSpeedCoef player != 1) then {
			player setAnimSpeedCoef 1;
		};
	};
};
player setVariable ["bodyTemp",_bodyTemp,true];