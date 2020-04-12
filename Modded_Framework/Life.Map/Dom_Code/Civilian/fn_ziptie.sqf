/*
	File: fn_ziptie.sqf
	Author: Dom
	Description: Zipties target unit
*/
params [
	["_unit",objNull,[objNull]]
];

if !([_unit,true] call DT_fnc_checkPlayer) exitWith {};
if !("D_Ziptie_i" in (magazines player)) exitWith {["You don't have any zipties.","red"] call DT_fnc_notify};
if (_unit getVariable ["tied",false]) exitWith {};

player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
waitUntil {animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"};
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
waitUntil {animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"};
player removeItem "D_Ziptie_i";
_unit setVariable ["tied",true,true];
remoteExec ["DT_fnc_ziptied",_unit];