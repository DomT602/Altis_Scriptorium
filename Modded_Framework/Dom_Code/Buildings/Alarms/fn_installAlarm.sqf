#include "\Dom_Code\script_macros.hpp"

/*
	File: fn_installAlarm.sqf
	Description: install a Alarm for the house
*/
params [
	["_item","",[""]]
];

private _building = nearestObject [player,"House"];
if (isNull _building) exitwith {};
if !(_building in client_keys) exitWith {["You need to be near a house you have keys to.","orange"] call DT_fnc_notify};
if !(getPlayerUID player isEqualTo _building getVariable ["owner",""]) exitWith {["You do not own this house.","orange"] call DT_fnc_notify};
if !(_building isKindOf "House_F") exitWith {["You are not near a house.","red"] call DT_fnc_notify};

if (animationState player !="AinvPknlMstpSnonWnonDnon_medic_1") then {
	player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	waitUntil {animationState player !="AinvPknlMstpSnonWnonDnon_medic_1";};
};

private _variable = switch _item do {
	case "PS_Alarm_i": {[false,0]};
	case "PS_Salarm_i": {[true,0]};
	case "PS_Galarm_i": {[true,2]};
	case "PS_PSalarm_i": {[false,1]};
	case "PS_Falarm_i": {[false,3]};
};

_building setVariable ["alarm",_variable,true];
//need to insert this to DB at some point