/*
	File: fn_onFired.sqf
	Author: Dom
	Description: Handles a fired 'weapon'
*/
params [
	["_unit",objNull,[objNull]],
	["_weapon","",[""]],
	"",
	"",
	["_ammoType","",[""]],
	"",
	["_projectile",objNull,[objNull]]
];

_fnc_handleGrenade = {
	params ["_projectile","_function","_target","_extraArguments"];
	[
		{
			params ["_arguments"];
			_arguments params ["_projectile"];
			if (isNull _projectile) exitWith {true};
			_arguments set [1,getPosATL _projectile];
		},
		{
			params ["_arguments","_pos","_function","_target","_extraArguments"];
			[_pos,_extraArguments] remoteExecCall [_function,_target];
		},
		[_projectile,[],_function,_target,_extraArguments]
	] call CBA_fnc_waitUntilAndExecute;
};

if (_ammoType isEqualTo "GrenadeHand_stone") exitWith {
	[_projectile,"DT_fnc_flashBanged",-2] call _fnc_handleGrenade;
};

if (_ammoType isEqualTo "SmokeShellYellow") exitWith {
	[_projectile,"DT_fnc_tearGas",-2] call _fnc_handleGrenade;
};

if (_ammoType isEqualTo "Molotov_Cocktail") exitWith {
	[_projectile,"server_fnc_createFire",2,"medium"] call _fnc_handleGrenade;
};

if (_ammoType isEqualTo "Camera") exitWith {
	[_projectile] spawn {
		params [
			["_projectile",objNull,[objNull]]
		];
		private "_position";
		waitUntil {
			if (isNull _projectile) exitWith {true};
			_position = getPosATL _projectile;
		};
		[_position] call DT_fnc_createCamera;
	};
};

["fired",[_unit,_weapon]] call DT_fnc_updateHUDPartial;

if (_weapon isEqualTo "Extinguisher") exitWith {
	[_projectile] spawn {
		params [
			["_projectile",objNull,[objNull]]
		];
		private "_position";
		waitUntil {
			if (isNull _projectile) exitWith {true};
			_position = getPosATL _projectile;
		};
		{
			if (str _x find "no shape" != -1) exitWith {
				[getPosATL _x] call DT_fnc_extinguishFire;
			};
		} forEach nearestObjects [_position,[],1.5];
	};
};

if (_weapon isEqualTo "Axe") exitWith {
	private _tree = objNull;
	private _objects = lineIntersectsWith [eyePos player, ATLtoASL (player modelToWorld [0, 3, 0]), player, objNull, true];
	{
		private _class = toLower (str _x);
		if (_class find "t_" != -1) exitWith {
			_tree = _x;
		};
	} forEach _objects;
	if (isNull _tree) exitWith {};

	if (alive _tree) then {
		[netId _tree,player getVariable ["level_woodcutting",1]] remoteExecCall ["server_fnc_treeHandleDamage",2];
	};
};