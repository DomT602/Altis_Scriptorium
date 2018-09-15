/*
    File: fn_garageChange.sqf
    Author: Dom
    Description: Changes info displayed at side of vehicle
*/
params [
    ["_control",controlNull,[controlNull]],
    ["_index",0,[0]]
];

(call compile format ["%1",(_control lbData _index)]) params ["_className","_colour","_plate"];

private _colour = (getArray(missionConfigFile >> "Textures" >> "Vehicle" >> _className >> "textures")) select _colour param [0];

private _infoBox = (findDisplay 1011) displayCtrl 1100;

_infoBox ctrlSetStructuredText parseText format [
    "Plate: %1 <br/>" +
    "Colour: %2 <br/>" +
    "Max Speed: %3 km/h<br/>" +
    "Horsepower: %4 <br/>" +
    "Seats: %5 <br/>" +
    "Fuel Capacity: %6",
    _plate,
    _colour,
    (getNumber(configFile >> "CfgVehicles" >> _className >> "maxSpeed")),
    (getNumber(configFile >> "CfgVehicles" >> _className >> "enginePower")),
    (getNumber(configFile >> "CfgVehicles" >> _className >> "transportSoldier")),
    (getNumber(configFile >> "CfgVehicles" >> _className >> "fuelCapacity"))
];
