/*
	File: fn_handleDamage.sqf
	Author: Dom
	Description: Damage handler for custom medical system
*/
params [
	["_unit",objNull,[objNull]],
	["_hitSelection","",[""]],
	["_damage",0,[0]],
	["_source",objNull,[objNull]],
	["_projectile","",[""]],
	["_index",0,[0]],
	["_instigator",objNull,[objNull]],
	["_hitPoint","",[""]]
];

if (_hitPoint in ["hitlegs","hithands","hitarms"]) exitWith {0}; //old
if (isNull _source) then {
	if (vehicle _unit isKindOf "Car") then {
		if (client_seatbelt) then {
			_damage = _damage / 2;
		} else {
			if (((speed vehicle _unit) > 75) && {!(_unit getVariable ["tied",false])} && {!(_unit getVariable ["restrained",false])}) then {
				private _velocity = ((velocity (vehicle _unit)) vectorMultiply 0.25) vectorAdd [0,0,5];
				playSound "glassbreak";
				unAssignVehicle _unit;
				moveOut _unit;
				_unit setVelocity _velocity;
			};
		};
	};
} else {
	if (_source isEqualTo _unit) exitWith {};
	client_lastDamage = [CBA_missionTime,_source];
	if (isNull objectParent _unit) then {
		if (vehicle _source isKindOf "Car") then { 
			private _speed = speed (vehicle _source);
			_damage = 0;
			private _injuries = _unit getVariable ["injuries",[]];
			if (_speed >= 50) then {
				_injuries set [4,1];
				_injuries set [5,1];
			} else {
				if (_injuries select 4 < 0.5) then {
					_injuries set [4,0.5];
				};
				if (_injuries select 5 < 0.5) then {
					_injuries set [5,0.5];
				};
			};
			_unit setVariable ["injuries",_injuries,true];
		} else {
			private _curWep = currentWeapon _source;
			if (_curWep isEqualTo "Taser_26") then {
				_damage = 0;
				[_curWep] call DT_fnc_knockedDown;
			};
		};
	};
};

private _part = call {
	if (_hitPoint in ["hithead","hitface","hitneck"]) exitWith {0};
	if (_hitPoint in ["hitpelvis","hitabdomen","hitdiaphragm","hitchest","hitbody","incapacitated"]) exitWith {1};
	if (_hitPoint in ["hitleftarm","hand_l"]) exitWith {2};
	if (_hitPoint in ["hitrightarm","hand_r"]) exitWith {3};
	if (_hitPoint in ["hitleftleg","leg_l"]) exitWith {4};
	if (_hitPoint in ["hitrightleg","leg_r"]) exitWith {5};
	if (_hitPoint isEqualTo "") exitWith {-1};
};
_damage = parseNumber (_damage toFixed 2);
[_part,_damage] call DT_fnc_healthHandler;
0;