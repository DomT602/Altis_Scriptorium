/*
	File: fn_houseMarkers.sqf
	Author: Dom
	Description: Pops down some markers for houses
*/

{
	private _house = nearestObject [_x, "House"];
	private _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

	private _marker = createMarkerLocal [format ["house_%1",round(random 99999)],_x];
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
} forEach client_houses;