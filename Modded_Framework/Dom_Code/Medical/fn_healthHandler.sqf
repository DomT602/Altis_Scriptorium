/*
	File: fn_healthHandler.sqf
	Author: Dom
	Description: Handles damage to body parts & blood
*/
params [
	["_part","",[""]],
	["_damage",0,[0]], 
	["_source",objNull,[objNull]]
];

if (_part isEqualTo "head" || _part isEqualTo "all") then {
	private _headDamage = player getVariable ["head",0];
	if (_headDamage isEqualTo 1) exitWith {};
	_headDamage = (_headDamage + _damage) min 1;
	player setVariable ["head",_headDamage,-2];
};

if (_part isEqualTo "torso" || _part isEqualTo "all") then {
	private _torsoDamage = player getVariable ["torso",0];
	if (_torsoDamage isEqualTo 1) exitWith {};
	_torsoDamage = (_torsoDamage + _damage) min 1;
	player setVariable ["torso",_torsoDamage,-2];
};

if (_part isEqualTo "arms" || _part isEqualTo "all") then {
	private _armsDamage = player getVariable ["arms",0];
	if (_armsDamage isEqualTo 1) exitWith {};
	_armsDamage = (_armsDamage + _damage) min 1;
	player setVariable ["arms",_armsDamage,-2];
};

if (_part isEqualTo "legs" || _part isEqualTo "all") then {
	private _legsDamage = player getVariable ["legs",0];
	if (_legsDamage isEqualTo 1) exitWith {};
	_legsDamage = (_legsDamage + _damage) min 1;
	player setVariable ["legs",_legsDamage,-2];
};

if (player getVariable ["dead",false]) exitWith {};

private _bleeding = player getVariable ["bleeding",0];
if ((round(random 5)) isEqualTo 5) then { //20% chance of bleeding effect
	_bleeding = (_bleeding + 1) min 5;
};
player setVariable ["bleeding",_bleeding,-2];

private _blood = player getVariable ["blood",5000];
private _damage = round(_damage * 600);
_blood = _blood - _damage;
systemChat format["Blood damage: %1 and new blood level: %2",_damage,_blood];
if (_blood < 1) then {
	[player,_source] call DT_fnc_onPlayerKilled;
	player setVariable ["blood",0,true];
} else {
	player setVariable ["blood",_blood,true];
};