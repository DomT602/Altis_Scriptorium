/*
	File: fn_breakDoor.sqf
	Author: Dom
	Description: Breaks down a door
*/
params [
	["_building",objNull,[objNull]]
];
if (isNull _building) exitWith {};
if (_building getVariable ["owner",""] isEqualTo "") exitWith {["Nobody owns this building.","orange"] call DT_fnc_notify};
if !("D_BoltCutter_i" in (magazines player)) exitWith {["You need boltcutters to do this.","orange"] call DT_fnc_notify};

private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "numberOfDoors");
private _door = 0;
for "_i" from 1 to _doors do {
	private _pos = _building modeltoWorld (_building selectionPosition format["Door_%1_trigger",_i]);
	if (player distance _pos < 2) exitWith {_door = _i};
};
if (_door isEqualTo 0) exitWith {["No nearby doors.","red"] call DT_fnc_notify};
if ((_building getVariable [format["bis_disabled_Door_%1", _door],0]) isEqualTo 0) exitWith {["The door is already unlocked.","blue"] call DT_fnc_notify};

(_building getVariable ["alarm",[false,false]]) params ["_police","_security"];
private _toAlert = [];
if (_police) then {
	_toAlert append (["cop"] call DT_fnc_findPlayers);
};
if (_security) then {
	_toAlert append (["security guard"] call DT_fnc_findJobPerson);
};
{
	private _toCheck = _x;
	{
		if (getPlayerUID _toCheck isEqualTo _x) exitWith {
			_toAlert pushBack _x;
		};
	} forEach (_building getVariable ["houseKeys",[]]);
} forEach playableUnits;

["Burglary in progress! It has been marked on your map.","red"] remoteExecCall ["DT_fnc_notify",_toAlert];
[_building,"type","Burglary in progress!","colour",150] remoteExecCall ["DT_fnc_createMarker",_toAlert];

["Boltcutting",15,"AinvPknlMstpSnonWnonDnon_medic_1","isNull objectParent player && player distance MB_Interaction_Target < 5",
{
	params [
		["_building",objNull,[objNull]],
		["_door",0,[0]]
	];
	player removeItem "D_BoltCutter_i";
	["Repairing finished.","green"] call DT_fnc_notify;
	_building setVariable [format["bis_disabled_Door_%1",_door],0,true];
	_building setVariable ["locked",false,true]; //allows into normal furniture (not safes)
	[player,""] remoteExecCall ["switchMove",-2];
},
{
	params [
		["_state",0,[0]]
	];

	[(switch _state do {
		case 1: {"Boltcutting cancelled."};
		case 2: {"You are dead."};
		case 3: {"Boltcutting failed."};
	}),"orange"] call DT_fnc_notify;
},
[_building,_door]] call DT_fnc_progressBar;