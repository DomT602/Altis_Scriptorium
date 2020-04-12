/*
	File: fn_removeFurniture.sqf
	Author: Dom
	Description: Delete selected furniture from DB
*/
params [
	["_furniture",objNull,[objNull]],
	["_house",objNull,[objNull]]
];
if (isNull _furniture) exitWith {};

private _id = _furniture getVariable ["furn_id",-1];
if (_id isEqualTo -1) exitWith {};
deleteVehicle _furniture;

private _houseID = _house getVariable ["id",-1];
private _set = [format["getFurniture:%1",_houseID],1] call MySQL_fnc_DBasync;
private _index = _set findIf {(_x select 0) isEqualTo _id};
if (_index isEqualTo -1) exitWith {};
_set deleteAt _index;
[format["updateFurniture:%1:%2",_set,_houseID],1] call MySQL_fnc_DBasync;