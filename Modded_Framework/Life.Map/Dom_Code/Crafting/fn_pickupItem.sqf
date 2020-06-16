/*
	File: fn_pickupItem.sqf
	Author: Dom
	Description: Handles picking up items related to crafting
*/
params [
	["_object",objNull,[objNull]]
];
private _type = typeOf _object;

if (_type in ['log','coal']) then { //crafting stuff
	(switch _type do {
		case "log": {["D_Log","You picked up a log."]}; //case 'class of item on ground': 'class of item for inventory'
		case "coal": {["D_Coal","You picked up some coal."]};
	}) params ["_item","_message"];

	if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange",5] call DT_fnc_notify};
	player addItem _item;
	[_message,"green",5] call DT_fnc_notify;
	deleteVehicle _object;
} else {
	if (_type in ["Small_Package","Land_Sleeping_bag_blue_folded_F"]) exitWith {
		if !(isNull client_carrying) exitWith {["You're already carrying something.","orange"] call DT_fnc_notify};
		if (_type isEqualTo "Small_Package") then {
			_object attachTo [player,[0.035,-.11,-0.1],"RightHandMiddle1"];
			[format["This package needs to be delivered to %1.",(vehicleVarName (_object getVariable ["pack_details",[]] select 0))]] call DT_fnc_notify;
		} else {
			_object attachTo [player,[0.1,-0.18,0],"rfemur"];
			_object setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];
		};
		client_carrying = _object;
	};
	
	if (_type isEqualTo "MW_spikeStrip") exitWith {
		player addItem "MW_spikeStrip_Closed";
		deleteVehicle _object;
	};

	private _hostCone = nearestObjects[getPosATL _object,["RoadCone_L_F"],5];
	{
		if !((_x getVariable ["components",[]]) isEqualTo []) exitWith {
			_hostCone = _x;
		};
	} forEach _hostCone;
	if !(_hostCone isEqualType objNull) exitWith {};

	private _components = _hostCone getVariable ["components",[]];
	{
		deleteVehicle _x
	} forEach _components;
	["Finished packing."] call DT_fnc_notify;
};