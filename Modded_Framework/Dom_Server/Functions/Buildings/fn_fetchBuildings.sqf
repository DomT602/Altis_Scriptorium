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
		["_pos",[0,0,0],[[]]],
		["_className","",[""]],
		["_gear",[],[[]]],
		["_dir",0,[0]],
		["_id",0,[0]]
	];
	private _house = nearestObject [_pos, "House"];
	private _furniturePiece = createVehicle [_className,[0,0,0],[],0,"NONE"];

	waitUntil {!isNull _furniturePiece};

	private _furniture = _house getVariable ["furniture",[]];
	_furniture pushBack _furniturePiece; //updates var on pushBack
	_furniturePiece allowDamage false;
	_furniturePiece setPosATL _pos;
	_furniturePiece setDir _dir;
	_furniturePiece setVariable ["furniture_owner",_uid,true];
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
	_furniturePiece addEventHandler ["containerClosed",{_this call DT_fnc_saveFurnitureInventory}];
} forEach _queryResult;

private _houses = [format["fetchHouses:%1",_uid],2] call MySQL_fnc_DBasync;

private _return = [];
{
	_x params [
		["_pos",[],[[]]]
	];
	private _house = nearestObject [_pos, "House"];
	_return pushBack [_pos];
} forEach _houses;

missionNamespace setVariable [format ["houses_%1",_uid],_return];
