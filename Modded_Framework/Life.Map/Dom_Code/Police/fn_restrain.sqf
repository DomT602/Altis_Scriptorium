/*
	File: fn_restrain.sqf
	Author: Dom
	Description: Restrains target unit
*/
params [
	["_unit",objNull,[objNull]]
];

if (client_blockActions || {_unit getVariable ["restrained",false]}) exitWith {};
if !([_unit] call DT_fnc_checkPlayer) exitWith {};
if !("D_Handcuffs_i" in (magazines player)) exitWith {["You don't have any handcuffs.","red"] call DT_fnc_notify};
if !(stance player isEqualTo "STAND") exitWith {["You need to be standing to do this."] call DT_fnc_notify};

player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";

player removeItem "D_Handcuffs_i";
_unit setVariable ["restrained",true,true];
remoteExec ["DT_fnc_restrained",_unit];