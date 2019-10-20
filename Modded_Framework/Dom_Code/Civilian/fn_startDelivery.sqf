/*
	File: fn_startDelivery.sqf
	Author: Dom
	Description: Starts a delivery mission, depending on the dialogs choice, in addAction do createDialog 'DT_delivery'
*/
params [
	["_type","small",[""]]
];

//createDialog "DT_delivery";
if !(isNull client_carrying) exitWith {["You're already carrying something.","orange"] call DT_fnc_notify};

(switch _type do {
	case "small": {["Small_Box",1,50]};
	case "medium": {};
	case "large": {};
}) params ["_class","_multiplier","_deposit"];

if ((player getVariable ["cash",0]) < _deposit) exitWith {[format["A $%1 deposit is required for this package.","orange"]] call DT_fnc_notify};
["cash",-_deposit] call DT_fnc_handleMoney;

private _point = selectRandom [delivery_points]; //needs populating
private _distance = player distance _point;
private _value = _distance * _multiplier;

private _object = _class createVehicle (getPosATL player);
_object attachTo [player,[0.035,-.11,-0.1],"RightHandMiddle1"];
_object setVariable ["pack_details",[_point,_value,CBA_missionTime],true];
client_carrying = _object;

[format["The $%1 deposit has been taken and the package has been given to you.",_deposit]] call DT_fnc_notify;