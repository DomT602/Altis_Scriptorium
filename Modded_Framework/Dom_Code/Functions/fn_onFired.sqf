/*
	File: fn_onFired.sqf
	Author: Dom
	Description: Handles a fired 'weapon'
*/
params [
	"",
	["_weapon","",[""]],
	"",
	"",
	["_ammoType","",[""]],
	"",
	["_projectile",objNull,[objNull]]
];

/*if (_ammoType isEqualTo "GrenadeHand_stone") exitWith {
	[_projectile] spawn {
		params [
			["_projectile",objNull,[objNull]]
		];
		private "_position";
		while {!isNull _projectile} do {
			_position = ASLtoATL (visiblePositionASL _projectile);
			sleep 0.1;
		};
		[_position] remoteExec ["DT_fnc_flashBanged",-2];
	};
};*/

if (_ammoType isEqualTo "SmokeShellYellow") exitWith {
	[_projectile] remoteExec ["DT_fnc_tearGas",-2];
};

if (_ammoType isEqualTo "Molotov_Cocktail") exitWith {
	[_projectile] spawn {
		params [
			["_projectile",objNull,[objNull]]
		];
		private "_position";
		while {!isNull _projectile} do {
			_position = ASLtoATL (visiblePositionASL _projectile);
			sleep 0.1;
		};
		[_position,"medium"] remoteExecCall ["server_fnc_createFire",2];
	};
};

if (_weapon isEqualTo "Extinguisher") exitWith {
	[getPosATL player] remoteExecCall ["server_fnc_extinguishFire",2];
};

if (_weapon isEqualTo "Axe") exitWith {
	private _classes = ["t_"]; //bo_t_
	private _tree = objNull;
	private _objects = lineIntersectsWith [eyePos player, ATLtoASL (player modelToWorld [0, 3, 0]), player, objNull, true];
	{
		private _object = _x;
		private _class = toLower (str _object);
		{
			if ((_class find (toLower _x)) != -1) exitWith { 
				_tree = _object;
			};
		} forEach _classes;
		if !(isNull _tree) exitWith {};
	} forEach _objects;
	if (isNull _tree) exitWith {};

	if (alive _tree) then {
		[netId _tree,(player getVariable ["level_woodcutting",1])] remoteExec ["server_fnc_treeHandleDamage",2];
	};
};