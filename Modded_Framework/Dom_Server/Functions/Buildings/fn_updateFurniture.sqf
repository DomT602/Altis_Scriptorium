/*
	File : fn_updateFurniture.sqf
	Author: Dom
	Description: Syncs furniture to DB
*/
params [
	["_furniture",objNull,[objNull]]
];
if (isNull _furniture) exitWith {};

private _id = _furniture getVariable ["furn_id",-1];
if (_id isEqualTo -1) exitWith {};

private _pos = getPosATL _furniture;
private _dir = [vectorDir _furniture,vectorUp _furniture];
private _gear = [getItemCargo _furniture,getMagazineCargo _furniture,getWeaponCargo _furniture,getBackpackCargo _furniture];

private _houseID = _house getVariable ["id",-1];
private _set = [format["getFurniture:%1",_houseID],1] call MySQL_fnc_DBasync;
private _index = _set findIf {(_x select 0) isEqualTo _id};
if (_index isEqualTo -1) exitWith {};
(_set select _index) params ["_id","_class"];
_set set [_index,[_id,_class,_pos,_gear,_dir]];
[format["updateFurniture:%1:%2",_set,_houseID],1] call MySQL_fnc_DBasync;