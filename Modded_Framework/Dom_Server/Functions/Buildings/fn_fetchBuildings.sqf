/*
	File : fn_fetchBuildings.sqf
	Author: Dom
	Description: Fetches buildings & furniture in building
*/
params [
	["_uid","",[""]],
	["_clientID",-1,[0]]
];
if (_uid isEqualTo "") exitWith {};

private _houses = [format["fetchHouses:%1",_uid],2,true] call MySQL_fnc_DBasync;
private _return = [];
{
	_x params [
		["_pos",[],[[]]],
		["_furnitureArray",[],[[]]]
	];
	private _house = nearestObject [_pos,"House"];
	_return pushBack _house;
	_house setVariable ["furniture",[],[_clientID,2]];
	{
		_x params [
			["_pos",[0,0,0],[[]]],
			["_className","",[""]],
			["_gear",[],[[]]],
			["_dir",0,[0]],
			["_id",0,[0]]
		];
		private _furniturePiece = createVehicle [_className,_pos,[],0,"CAN_COLLIDE"];

		private _furniture = _house getVariable ["furniture",[]];
		_furniture pushBack _furniturePiece; //updates var on pushBack
		_furniturePiece allowDamage false;
		_furniturePiece setVectorDirAndUp _dir;
		_furniturePiece setVariable ["furn_id",_id,[_clientID,2]];
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
	} forEach _furnitureArray;
} forEach _houses;
_return;
