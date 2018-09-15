/*
    File: fn_insertVehicle.sqf
    Author: Dom
    Description: Recieves request to insert vehicle into DB
*/
params [
    ["_uid","",[""]],
    ["_vehicle",objNull,[objNull]],
    ["_faction","civ",[""]],
    ["_colour",-1,[0]]
];

if (_uid isEqualTo "" || {isNull _vehicle} || {_color isEqualTo -1}) exitWith {};
	
private _className = typeOf _vehicle;
private _type = call {
    if (_vehicle isKindOf "Car") exitWith {"Car"};
    if (_vehicle isKindOf "Air") exitWith {"Air"};
    if (_vehicle isKindOf "Ship") exitWith {"Ship"};
};

private "_plate";
private _letterArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
for "_i" from 0 to 1 step 0 do {
    private _randomPlate = "";
    private _plateArray = [];
    for "_y" from 0 to 2 step 1 do {
        _plateArray pushBack (selectRandom _letterArray)
    };
    for "_v" from 0 to 3 step 1 do {
        _plateArray pushBack floor(random 10)
    };
    _randomPlate = _plateArray joinString "";

    private _return = [format["checkPlate:%1",_randomPlate],2] call MySQL_fnc_DBasync;

    if (_return isEqualTo []) exitWith {_plate = _randomPlate};
};

[format["insertVehicle:%1:%2:%3:%4:%5:%6",_faction,_className,_type,_uid,_plate,_colour],1] call MySQL_fnc_DBasync;

_vehicle setVariable ["plate",_plate,true]; //plate is a string - key_holders are set in fn_vehicleShopBuy
//_vehicle setPlateNumber _plate;