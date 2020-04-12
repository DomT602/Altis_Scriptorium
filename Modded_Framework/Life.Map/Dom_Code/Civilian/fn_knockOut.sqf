/*
	File: fn_knockOut.sqf
	Author: Dom
	Description: Knock-outs target unit
*/
params [
	["_unit",objNull,[objNull]]
];

if (currentWeapon player in ["","Binocular","Rangefinder"] || {!isNull objectParent player}) exitWith {};
if (client_blockActions || !([_unit,true,2] call DT_fnc_checkPlayer) || (animationState _unit == "unconscious") || !(stance player isEqualTo "STAND")) exitWith {};

player playMove "AwopPercMstpSgthWrflDnon_End2";
waitUntil {animationState player != "AwopPercMstpSgthWrflDnon_End2"};

["hands"] remoteExecCall ["DT_fnc_knockedDown",_unit];