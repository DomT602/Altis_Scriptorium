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

//if (_hitPoint in ["hitlegs","hithands","hitarms"]) exitWith {0}; //old

if (_hitPoint isEqualTo "") then {_hitPoint = "all"};
_unit setVariable [_hitPoint,_damage];

if (_hitPoint isEqualTo "dt_lasthitpoint") exitWith { //this event triggers twice, one with a tiny damage number (such as 2.48316e-006)
	client_lastDamage = [CBA_missionTime,_source];

	private _allBodyDamage = _unit getVariable ["all",0];

	private _headDamages = [
		_unit getVariable ["hitface",0],
		_unit getVariable ["hitneck",0],
		_unit getVariable ["hithead",0]
	];
	_headDamages sort false;
	_headDamages params ["_headDamage"];

	private _torsoDamages = [
		_unit getVariable ["hitpelvis",0],
		_unit getVariable ["hitabdomen",0],
		_unit getVariable ["hitdiaphragm",0],
		_unit getVariable ["hitchest",0]
	];
	_torsoDamages sort false;
	_torsoDamages params ["_torsoDamage"];

	private _leftArmDamage = _unit getVariable ["hitleftarm",0];
	private _rightArmDamage = _unit getVariable ["hitrightarm",0];

	private _leftLegDamage = _unit getVariable ["hitleftleg",0];
	private _rightLegDamage = _unit getVariable ["hitrightleg",0];

	private _damageArray = [
		[_headDamage,3,0],
		[_torsoDamage,4,1],
		[_leftArmDamage,(1 + random 1),2],
		[_rightArmDamage,(1 + random 1),3],
		[_leftLegDamage,(1 + random 1),4],
		[_rightLegDamage,(1 + random 1),5]
	];
	_damageArray sort false;
	(_damageArray select 0) params ["_recievedDamage","","_hitIndex"];

	if (_recievedDamage isEqualTo 0) then {
		_recievedDamage = _allBodyDamage;
	};

	if (_projectile isEqualTo "") then { //this is damage from environment aka falls
		if !(isNull _source) then {
			if (_source isEqualTo _unit && {(velocity _unit select 2) < -1}) then {
				//falling
				_hitIndex = 4 + round(random(1)); //pick a random leg
			} else {
				//likely to be an empty vehicle or physX object hitting player
				_hitIndex = 2 + round(random(1)); //pick a random limb
			};
			//likely to be fire damage
			_hitIndex = 1; //pick main body to damage
		};
	} else {
		//there is projectile - gunshot/collision with vehicle
		private _curWep = currentWeapon _source;
		if (_curWep isEqualTo "Taser_26") then {
			[_curWep] call DT_fnc_knockedDown;
			_recievedDamage = 0;
		} else {
			if (isNull objectParent _unit && {vehicle _source isKindOf "Car"}) then {
				private _speed = speed (vehicle _source);
				_recievedDamage = 0;
				private _injuries = _unit getVariable ["injuries",[]];
				private _newLeftLegDamage = ((_injuries select 4) + (_recievedDamage / 2)) min 1;
				private _newRightLegDamage = ((_injuries select 5) + (_recievedDamage / 2)) min 1;
				_injuries set [4,_newLeftLegDamage];
				_injuries set [5,_newRightLegDamage];
				_unit setVariable ["injuries",_injuries,true];
				_recievedDamage = 0;
			};
		};
	};

	if (_recievedDamage > 0.0000001) then {
		[_hitIndex,_recievedDamage] call DT_fnc_healthHandler;
	};

	{
		_unit setVariable [_x,0];
	} forEach ["hitface","hitneck","hithead","hitpelvis","hitabdomen","hitdiaphragm","hitchest","hitleftarm","hitrightarm","hitleftleg","hitrightleg"];

	0;
};

if (_hitPoint isEqualTo "all" && {_projectile isEqualTo ""} && {!(isNull objectParent _unit)}) then {
	//vehicle crash, gotta choose what damage we give them? could do all body parts but lower damage? idk
	if (vehicle _unit isKindOf "Car") then {
		if (client_seatbelt) then {
			_damage = _damage / 2;
		} else {
			if (((speed vehicle _unit) > 75) && {!(_unit getVariable ["tied",false])} && {!(_unit getVariable ["restrained",false])}) then {
				private _velocity = ((velocity (vehicle _unit)) vectorMultiply 0.25) vectorAdd [0,0,5];
				playSound "glassbreak";
				moveOut _unit;
				_unit setVelocity _velocity;
			};
		};
	};
	[-1,_damage] call DT_fnc_healthHandler;
};
0