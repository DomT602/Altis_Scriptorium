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

systemChat format["%1 recieved %2 damage on part: %3 from %4",name _unit, _damage, _hitPoint, name _instigator];

if !(isNull _source) then {
	if (_source isEqualTo _unit) exitWith {};
	if (isNull objectParent _unit) then {
		private _speed = speed (vehicle _source);
		if (_speed >= 50) then {
			_unit setVariable ["legs",1,true];
		} else {
			if (_unit getVariable ["legs",0] < 0.5) then {
				_unit setVariable ["legs",0.5,true];
			};
		};
	};

	private _curWep = currentWeapon _source;
	if (_curWep in ["prpl_benelli_14_pgs_rail","Taser_26"] && _projectile in ["prpl_B_12Gauge_Slug","26_cartridge"]) exitWith {
		if (isNull objectParent _unit) then {
			[_curWep] call DT_fnc_knockedDown;
		};
	};
};

if (vehicle _unit isKindOf "Car" && {isNull _source || _source isEqualTo _unit}) then {
	if (client_seatbelt) then {
		_damage = _damage / 2;
	} else {
		if (((speed vehicle _unit) > 90) && {!(_unit getVariable ["tied",false])} && {!(_unit getVariable ["restrained",false])}) then {
			velocity (vehicle _unit) params ["_xVel","_yVel","_zVel"];
			playSound "glassbreak";
			unAssignVehicle _unit;
			moveOut _unit;
			_unit setVelocity [_xVel * 0.25,_yVel * 0.25,(_zVel * 0.25) + 5];
			
		};
	};
};

private _part = call {
	if (_hitPoint in ["HitHead","HitFace","HitNeck"]) exitWith {"head"};
	if (_hitPoint in ["HitPelvis","HitAbdomen","HitDiaphragm","HitChest","HitBody"]) exitWith {"torso"};
	if (_hitPoint in ["HitArms","HitHands"]) exitWith {"arms"};
	if (_hitPoint in ["HitLegs"]) exitWith {"legs"};
	if (_hitPoint isEqualTo "") exitWith {"all"};
};

[_part,_damage,_instigator] call DT_fnc_healthHandler;

0;