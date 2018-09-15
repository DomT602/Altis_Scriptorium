/*
	File: fn_onInventoryOpened.sqf
	Author: Dom
	Description: Handles whenever the player opens their inventory
*/

params [
	["_unit",objNull,[objNull]],
	["_container",objNull,[objNull]]
];

if (isNull _container) exitWith {
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
	false
};

if (_container getVariable ["inUse",false]) exitWith {
	["Only one person can be in the inventory at a time.","red"] call DT_fnc_notify;
	true;
};

if ((getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack")) isEqualTo 1) exitWith {
	["You cannot open this backpack.","red"] call DT_fnc_notify;
	true;
};

private _furnitureList = [];
if ((typeOf _container) in _furnitureList) exitWith {
	private _house = nearestObject [player, "House"];
	if !(_house in client_keys) && (_house getVariable ["locked",true]) exitWith {
		["This furniture is locked.","red"] call DT_fnc_notify;
		true;
	};
};

if (_container isKindOf "LandVehicle" || _container isKindOf "Ship" || _container isKindOf "Air") exitWith {
	if (!(_container in client_keys) && {locked _container isEqualTo 2}) exitWith {
		["This vehicle is locked.","red"] call DT_fnc_notify;
		true;
	};
};
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