/*
	File: fn_updateTemperature.sqf
	Author: Dom
	Description: Updates the global value for the current temperature
*/
private _temperatures = [10,11,12,12,13,14,15.5,15,14,13,12,11];
private _baseTemp = _temperatures select (date select 1);

private _lat = abs(getNumber(configFile >> "CfgWorlds" >> worldName >> "latitude"));
private _day = 360 * (dateToNumber date);

private _sunEffect = 0.1 * (((12 * cos(_day) - 78) * cos(_lat) * cos(daytime * 15)) - (24 * sin(_lat) * cos(_day)));
private _overcastEffect = overcast * 5;
private _rainEffect = rain * 5;
private _windEffect = gusts * 5;

current_temperature = ceil(_baseTemp + _sunEffect - _overcastEffect - _rainEffect - _windEffect);
publicVariable "current_temperature";