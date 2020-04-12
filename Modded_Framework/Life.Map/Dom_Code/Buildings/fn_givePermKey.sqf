/*
	File: fn_givePermKey.sqf
	Author: Dom
	Description: Gives selected player a permanent house key
*/
params [
	["_unit",objNull,[objNull]],
	["_house",objNull,[objNull]]
];

if !([_unit,true] call DT_fnc_checkPlayer) exitWith {};
private _keys = _house getVariable ["houseKeys",[]];
if (_keys findIf {getPlayerUID _unit isEqualTo (_x select 0)} != -1) exitWith {["This person already has a key."] call DT_fnc_notify};
private _name = ["Unknown",_unit] call DT_fnc_findName;
private _action = [
	format ["Are you sure you want to give %1 a permanent key to this house?",_name],
	"House key",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if (_action) then {
	_keys pushBack [getPlayerUID _unit,name _unit];
	_house setVariable ["houseKeys",_keys,true];
	[format["You gave %1 a key to your house.",_name],"green"] call DT_fnc_notify;
	["You have been given permanent access to a nearby house.","green"] remoteExecCall ["DT_fnc_notify",_unit];
	[_house] remoteExecCall ["DB_fnc_keyChange",2];
};