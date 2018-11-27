/*
    File: fn_switchLights.sqf
    Author: Dom
    Description: Switches the state of a houses lights
*/
params [
    ["_house",objNull,[objNull]]
];
if (isNull _house) exitWith {};

if (isNull (_house getVariable ["lightSource",objNull])) then {
    private _lightPos = (getArray (missionConfigFile >> "Housing" >> "Houses" >> (typeOf _house) >> "lightPos"));
    if (_lightPos isEqualTo []) exitWith {};
    private _lightSource = "#lightpoint" createVehicle [0,0,0];
    _lightSource lightAttachObject [_house,_lightPos];
    _lightSource setLightColor [250,150,50];
    _lightSource setLightAmbient [1,1,0.2];
    _lightSource setLightAttenuation [1,0,0,0];
    _lightSource setLightIntensity 10;
    _lightSource setLightUseFlare true;
    _lightSource setLightFlareSize 0.2;
    _lightSource setLightFlareMaxDistance 50;
    _house setVariable ["lightSource",_lightSource];
} else {
    deleteVehicle (_house getVariable ["lightSource",objNull]);
};