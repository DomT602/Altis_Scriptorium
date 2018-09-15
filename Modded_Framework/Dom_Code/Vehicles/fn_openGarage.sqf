/*
    File: fn_openGarage.sqf
    Author: Dom
    Description: Opens the players garage
*/
private _display = findDisplay 1011;
if (isNull _display) exitWith {}; //closed menu before recieving data
params [
    ["_vehicles",[],[[]]]
];

if (_vehicles isEqualTo []) exitWith {closeDialog 0; ["You have no vehicles in this garage.","orange"] call DT_fnc_notify};
disableSerialization;

private _control = _display displayCtrl 1500;
lbClear _control;

{
    _x params [
        ["_id",0,[0]],
        ["_className","Default",[""]],
        ["_plate","",[""]],
        ["_colour",0,[0]]
    ];
    ([_className] call DT_fnc_fetchDetails) params ["_name","_picture"];
    _control lbAdd _name;
    _control lbSetData [(lbSize _control)-1,(str([_className,_colour,_plate]))];
    _control lbSetValue [(lbSize _control)-1,_id];
    _control lbSetPicture [(lbSize _control)-1,_picture];
} forEach _vehicles;