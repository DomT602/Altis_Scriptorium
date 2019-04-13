/*
    File: fn_knockOut.sqf
    Author: Dom
    Description: Knock-outs target unit
*/
params [
	["_unit",objNull,[objNull]]
];

if (client_blockActions || !([_unit,true] call DT_fnc_checkPlayer) || (animationState _unit == "unconscious") || !(stance player isEqualTo "STAND")) exitWith {};
	
player playMove "AwopPercMstpSgthWrflDnon_End2";
waitUntil {animationState player != "AwopPercMstpSgthWrflDnon_End2"};

["Hands"] remoteExecCall ["DT_fnc_knockedDown",_unit];