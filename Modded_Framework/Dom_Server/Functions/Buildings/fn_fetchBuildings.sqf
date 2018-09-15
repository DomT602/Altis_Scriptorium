/*
    File : fn_fetchBuildings.sqf
    Author: Dom
    Description: Fetches buildings & furniture in building
*/
params [
    ["_uid","",[""]]
];
if (_uid isEqualTo "") exitWith {};

private _queryResult = [format["fetchFurniture:%1",_uid],2] call MySQL_fnc_DBasync;

{
    _x params [
        "_pid",
        "_pos",
        "_className",
        "_inventory",
        "_gear",
        "_dir",
        "_id"
    ];
    _pos = parseSimpleArray format ["%1",_pos];
    private _house = nearestObject [_pos, "House"];
    private _direction = parseSimpleArray format ["%1",_dir];
    private _gear = [_gear] call DB_fnc_mresToArray;
    if (_gear isEqualType "") then {_gear = parseSimpleArray format ["%1", _gear]};
    private _furniturePiece = createVehicle[_className,[0,0,999],[],0,"NONE"];

    waitUntil {!isNull _furniturePiece};

    _furniture = _house getVariable ["furniture",[]];
    _furniture pushBack _furniturePiece;
    _furniturePiece allowDamage false;
    _furniturePiece setPosATL _pos;
    _furniturePiece setVectorDirAndUp _direction;

    _pos params ["_posX", "_posY", "_posZ"];
    (getPosATL _furniturePiece) params ["_curPosX", "_curPosY", "_curPosZ"];
    _fixX = _curPosX - _posX;
    _fixY = _curPosY - _posY;
    _fixZ = _curPosZ - _posZ;
    _furniturePiece setPosATL [(_posX - _fixX), (_posY - _fixY), (_posZ - _fixZ)];
    _furniturePiece setVectorDirAndUp _direction;
    _furniturePiece setVariable ["furniture_owner",_pid,true];
    _furniturePiece setVariable ["furniture_id",_id,true];
    clearWeaponCargoGlobal _furniturePiece;
    clearItemCargoGlobal _furniturePiece;
    clearMagazineCargoGlobal _furniturePiece;
    clearBackpackCargoGlobal _furniturePiece;
    if !(_gear isEqualTo []) then {
        _gear params ["_items", "_mags", "_weapons", "_backpacks"];
        for "_i" from 0 to ((count (_items select 0)) - 1) do {
            _furniturePiece addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
        };
        for "_i" from 0 to ((count (_mags select 0)) - 1) do {
            _furniturePiece addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
        };
        for "_i" from 0 to ((count (_weapons select 0)) - 1) do {
            _furniturePiece addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
        };
        for "_i" from 0 to ((count (_backpacks select 0)) - 1) do {
            _furniturePiece addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
        };
    };
    _furniturePiece addEventHandler ["ContainerClosed",{_this call DT_fnc_saveFurnitureInventory}];
    _house setVariable ["furniture",_furniture,true];
} forEach _queryResult;

private _houses = [format["fetchHouses:%1",_uid],2] call MySQL_fnc_DBasync;

_return = [];
{
    _x params [
        "_pos"
    ];
    _pos = parseSimpleArray format ["%1",_pos];
    _house = nearestObject [_pos, "House"];
    _return pushBack [_pos];
} forEach _houses;

missionNamespace setVariable [format ["houses_%1",_uid],_return];
