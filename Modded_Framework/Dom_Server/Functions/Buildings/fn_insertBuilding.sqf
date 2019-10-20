/*
	File: fn_insertBuilding.sqf
	Author: Dom
	Description: Inserts selected building into DB
*/
params [
	["_uid","",[""]],
	["_building",objNull,[objNull]],
	["_type",-1,[0]],
	["_name","",[""]]
];

if (isNull _building || {_uid isEqualTo ""} || {_type isEqualTo -1}) exitWith {};
private _pos = getPosATL _building;
switch _type do {
	case 0: {[format["insertBuilding:%1:%2:%3",_uid,_pos,_type],1] call MySQL_fnc_DBasync};
	case 1: {[format["insertBuilding:%1:%2:%3",_uid,_pos,_type],1] call MySQL_fnc_DBasync};
	case 2: {[format["insertShop:%1:%2:%3",_uid,_pos,_name],1] call MySQL_fnc_DBasync};
};

[
	{
		params [
			["_uid","",[""]],
			["_building",objNull,[objNull]],
			["_type",-1,[0]],
			["_pos",[],[[]]],
			["_name","",[""]]
		];
		private _id = if (_type isEqualTo 2) then {
			([format["insertedShop:%1:%2",_pos,_uid],2] call MySQL_fnc_DBasync) select 0;
		} else {
			([format["insertedBuilding:%1:%2",_pos,_uid],2] call MySQL_fnc_DBasync) select 0;
		};
		_building setVariable ["id",_id,false];
		_building setVariable ["shop_name",_name,true];
		private _mark = createMarker [format["shop%1",_id],_building];
		_mark setMarkerText _name;
		_mark setMarkerType "Mil_dot";
		_mark setMarkerColor "ColorBlack";
	},
	[_uid,_building,_type,_pos,_name],
	0.3
] call CBA_fnc_waitAndExecute;