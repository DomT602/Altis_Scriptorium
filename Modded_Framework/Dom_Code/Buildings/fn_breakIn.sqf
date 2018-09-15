#include "\Dom_Code\script_macros.hpp"

/*
	File: fn_breakin.sqf
	Description: Breaks into house
*/

params ["_building",objNull,[objNull]];

if (isNull _building) exitWith{};
if !(_building isKindOf "House_F") exitWith {["You are not near a house door!","red"] call DT_fnc_notify};
if !("D_BoltCutter_i" in (magazines player)) exitWith {["You need boltcutters to do this.","orange"] call DT_fnc_notify};

private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "numberOfDoors");
private _door = 0;

for "_i" from 1 to _doors do {
	private _selpos = _building selectionPosition format ["door_%1_triger",_i];
	private _worldspace = _building modeltoWorld _selpos;
		if (player distance _worldSpace <2) exitWith {_door = _i};
};

if (_door isEqualTo 0) exitWith {["You are not near a door to Break.","red"]call DT_fnc_notify};
if ((_building getVariable [format["bis_disabled_Door_%1", _door],0]) isEqualTo 0) exitWith {["The door is already open.","blue"]call DT_fnc_notify};
if ((_buidling getVariable ["Alarmed",[]]) call "");

for "_i" from 0 to 1 step 0 do {
	if (animationState player !="AinvPknlMstpSnonWnonDnon_medic_1") then {
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
};

player playActionNow "stop";
if (!alive player) exitWith {["You Died!","red"] call DT_fnc_notify};
if (player getVariable ["restrained", false]) exitwith {["You have been restrained.","red"] call DT_fnc_notify};
if (player getVariable ["Tazed", false]) exitwith {["You have been Tazed.","red"] call DT_fnc_notify};

Private _dice = random(100);
if (_dice < 50) then {
	_building setVariable [format ["bis_disabled_Door_%1",_door],0,true];
	_building setVariable ["locked",false,true];
	player removeMagazine "D_BoltCutter_i";
	["You've successfully broke in!", "green"] call DT_fnc_notify;
} else {
	["You've Failed try again.","red"] call DT_fnc_notify;
	player removeMagazines "D_BoltCutter_i";
};
