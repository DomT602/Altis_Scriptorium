/*
	File: fn_pickupItem.sqf
	Author: Dom
	Description: Handles picking up items related to crafting
*/
params [
    ["_object",objNull,[objNull]]
];
_object = typeOf _object;

if (_object in ['log','coal']) then { //crafting stuff
	(switch _object do {
	    case "log": {["D_Log","You picked up a log."]}; //case 'class of item on ground': 'class of item for inventory'
	    case "coal": {["D_Coal","You picked up some coal."]};
	}) params ["_item","_message"];

	if !(player canAdd _item) exitWith {["You don't have enough room for this item.","orange",5] call DT_fnc_notify};
	player addItem _item;
	[_message,"green",5] call DT_fnc_notify;
	deleteVehicle _object;
} else {
	private _hostCone = nearestObjects[getPosATL _object,["RoadCone_L_F"],5];
	{
		if !(isNil {_x getVariable ["components",[]]}) exitWith {
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