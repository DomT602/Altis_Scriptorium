/*
    File: fn_knockOut.sqf
    Author: Dom
    Description: Knock-outs target unit
*/
params [
	["_unit",objNull,[objNull]]
];

if (client_blockActions) exitWith {};
if !([_unit] call DT_fnc_checkPlayer) exitWith {};
if (animationState _unit == "unconscious") exitWith {};
if !(stance player isEqualTo "STAND") exitWith {};
	
player playMove "AwopPercMstpSgthWrflDnon_End2";
waitUntil {animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"};

["Hands"] remoteExec ["DT_fnc_knockedDown",_unit];