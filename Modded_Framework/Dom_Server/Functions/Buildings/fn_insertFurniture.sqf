/*
	File: fn_insertFurniture.sqf
	Author: Dom
	Description: Inserts selected furniture into DB
*/
params [
	["_furniture",objNull,[objNull]],
	["_house",objNull,[objNull]]
];
if (isNull _furniture) exitWith {};

private _pos = getPosATL _furniture;
private _className = typeOf _furniture;
private _dir = [vectorDir _furniture,vectorUp _furniture];
private _furnArray = _house getVariable ["furniture",[]];
private _lastFurnID = (_furnArray select (count _furnArray - 1)) getVariable ["furn_id",-1];
private _newID = _lastFurnID + 1;
_furniture setVariable ["furn_id",_newID,[remoteExecutedOwner,2]];
_furnArray pushBack _furniture;

private _houseID = _house getVariable ["id",-1];
private _set = [format["getFurniture:%1",_houseID],1] call MySQL_fnc_DBasync;
_set pushBack [_newID,_className,_pos,[],_dir];
[format["updateFurniture:%1:%2",_set,_houseID],1] call MySQL_fnc_DBasync;

