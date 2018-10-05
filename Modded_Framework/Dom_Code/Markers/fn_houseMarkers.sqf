/*
    File: fn_houseMarkers.sqf
    Author: Dom
    Description: Pops down some markers for houses
*/

{
    _x params ["_position"];
    private _house = nearestObject [_position, "House"];
    private _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

    private _marker = createMarkerLocal [format ["house_%1",round(random 99999)],_position];
    _marker setMarkerTextLocal _houseName;
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerTypeLocal "loc_Lighthouse";
} forEach client_houses;