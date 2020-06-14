/*
	File: fn_tearGas.sqf
	Author: Dom
	Description: Uses a yellow smoke grenade as teargas
*/
params [
	["_projectile",objNull,[objNull]]
];

[
	{
		params [["_projectile",objNull]];
		isNull _projectile || {_projectile distance player < 15}
	},
	{
		params [["_projectile",objNull]];
		if (isNull _projectile) exitWith {};
		[_projectile] spawn {
			params ["_projectile"];
			private _masks = ["H_Shemag_olive"];
			private "_escHandler";
			while {!isNull _projectile} do {
				if (_projectile distance player < 10 && !((headgear player) in _masks || (goggles player) in _masks)) then {
					_escHandler = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"];
					"dynamicBlur" ppEffectEnable true;
					"dynamicBlur" ppEffectAdjust [20];
					"dynamicBlur" ppEffectCommit 3;
					enableCamShake true;
					addCamShake [10,20,5];
					player setFatigue 1;
				} else {
					"dynamicBlur" ppEffectAdjust [0];
					"dynamicBlur" ppEffectCommit 10;
				};
				sleep 5;
			};
			sleep 5;
			"dynamicBlur" ppEffectAdjust [0];
			"dynamicBlur" ppEffectCommit 10;
			resetCamShake;
			sleep 10;
			"dynamicBlur" ppEffectEnable false;
			(findDisplay 46) displayRemoveEventHandler ["keyDown",_escHandler];
		};
	},
	_projectile
] call CBA_fnc_waitUntilAndExecute;