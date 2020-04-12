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

[
	{
		!(isNull (findDisplay 49))
	},
	{
		(findDisplay 49) closeDisplay 2;
		[player,"Attempted Esc+I dupe"] remoteExecCall ["server_fnc_logAction",2];
	},
	0,
	2.5,
	{
		nil
	}
] call CBA_fnc_waitUntilAndExecute;

private _furnitureList = [];

if !(isNull (_container getVariable ["inUse",objNull])) exitWith {
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
	} forEach [_container,_secContainer];
};

if !(_return) then {
	_container setVariable ["inUse",player,true];
	[
		{
			(_this getVariable ["inUse",objNull]) != player || {player distance _container > 7}
		},
		{
			private _unit = _this getVariable ["inUse",objNull];
			if !(isNull _unit) then {
				(findDisplay 602) closeDisplay 2;
				[player,format["Had inventory open at same time as %1 (%2)",name _unit,getPlayerUID _unit]] remoteExecCall ["server_fnc_logAction",2];
			};
		},
		_container
	] call CBA_fnc_waitUntilAndExecute;
};
_return