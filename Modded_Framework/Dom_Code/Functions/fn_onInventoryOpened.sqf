/*
	File: fn_onInventoryOpened.sqf
	Author: Dom
	Description: Handles whenever the player opens their inventory
*/

params [
	["_unit",objNull,[objNull]],
	["_container",objNull,[objNull]],
	["_secContainer",objNull,[objNull]]
];

private _furnitureList = [];

if (_container getVariable ["inUse",false]) exitWith {
	["Only one person can be in the inventory at a time.","red"] call DT_fnc_notify;
	true
};

private _return = call {
	{
		if (isNull _x) exitWith {false};

		private _containerType = typeOf _x;

		if ((getNumber(configFile >> "CfgVehicles" >> _containerType >> "isBackpack")) isEqualTo 1) exitWith {
			["You cannot open this backpack.","red"] call DT_fnc_notify;
			true
		};

		if (_containerType in _furnitureList) exitWith {
			private _house = nearestObject [player, "House"];
			if (!(_house in client_keys) && {_house getVariable ["locked",true]}) exitWith {
				["This furniture is locked.","red"] call DT_fnc_notify;
				true
			};
			false
		};

		if (_x isKindOf "LandVehicle" || _x isKindOf "Ship" || _x isKindOf "Air") exitWith {
			if (!(_x in client_keys) && {locked _x isEqualTo 2}) exitWith {
				["This vehicle is locked.","red"] call DT_fnc_notify;
				true
			};
			false
		};
	} forEach [_container, _secContainer];
};

if !(_return) then {
	_container setVariable ["inUse",true,true];
	[
		{
			!isNull (findDisplay 602)
		},
		{
			private _display = findDisplay 602;
			(_display displayCtrl 638) ctrlSetEventHandler ["LBDblClick","_this spawn DT_fnc_handleItem"];  
			(_display displayCtrl 633) ctrlSetEventHandler ["LBDblClick"," _this spawn DT_fnc_handleItem"];  
			(_display displayCtrl 619) ctrlSetEventHandler ["LBDblClick","_this spawn DT_fnc_handleItem"];
		}
	] call CBA_fnc_waitUntilAndExecute;
};
_return