/*
	File: fn_placeFurniture.sqf
	Author: Dom
	Description: Starts placing the furniture item
*/
params [
	["_furniture","",[""]] //this is the physical item
];
if (_furniture isEqualTo "") exitWith {};

private _house = nearestObject [player,"House"];
if !(getPlayerUID player isEqualTo (_house getVariable ["owner",""])) exitWith {["You need to be near a house you own.","orange"] call DT_fnc_notify};
if (count(_house getVariable ["furniture",[]]) >= (getNumber(missionConfigFile >> "Buildings" >> "Houses" >> (typeOf _house) >> "maxFurniture"))) exitWith {["You can't fit any more furniture in this building.","orange"] call DT_fnc_notify};

private _className = switch _furniture do { //this gets the vehicle/classname
	case "Wardrobe": {"Furn_Ward_i"};
};

private _piece = _className createVehicle [0,0,0];
_piece enableSimulation false;
_piece attachTo [player,[0.1,1,1]];
furniture_vehicle = _piece;
//_altPos = [0.16, 3, ((boundingBoxReal _object) select 1) select 2];

clearWeaponCargoGlobal _piece;
clearMagazineCargoGlobal _piece;
clearItemCargoGlobal _piece;
clearBackpackCargoGlobal _piece;

furnitureKeyHandler = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call DT_fnc_handleFurnitureKey"];