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
	_headDamage = player getVariable ["head",0];
	_headDamage = _headDamage + _damage;
	if (_headDamage > 1) then {
		_headDamage = 1
	};
	player setVariable ["head",_headDamage,true];
};

if (_part isEqualTo "torso" || _part isEqualTo "all") then {
	_torsoDamage = player getVariable ["torso",0];
	_torsoDamage = _torsoDamage + _damage;
	if (_torsoDamage > 1) then {
		_torsoDamage = 1
	};
	player setVariable ["torso",_torsoDamage,true];
};

if (_part isEqualTo "arms" || _part isEqualTo "all") then {
	_armsDamage = player getVariable ["arms",0];
	_armsDamage = _armsDamage + _damage;
	if (_armsDamage > 1) then {
		_armsDamage = 1
	};
	player setVariable ["arms",_armsDamage,true];
};

if (_part isEqualTo "legs" || _part isEqualTo "all") then {
	_legsDamage = player getVariable ["legs",0];
	_legsDamage = _legsDamage + _damage;
	if (_legsDamage > 1) then {
		_legsDamage = 1
	};
	player setVariable ["legs",_legsDamage,true];
};

if (player getVariable ["dead",false]) exitWith {};

_bleeding = player getVariable ["bleeding",0];
if ((round(random 5)) isEqualTo 5) then { //20% chance of bleeding effect
	_bleeding = _bleeding + 1;
	if (_bleeding > 5) then {
		_bleeding = 5
	};
};
player setVariable ["bleeding",_bleeding,true];

_blood = player getVariable ["blood",5000];
_damage = round(_damage * 600);
_blood = _blood - _damage;
systemChat format["Blood damage: %1 and new blood level: %2",_damage,_blood];
if(_blood < 1) then {
	[player,_source] call DT_fnc_onPlayerKilled;
	player setVariable ["blood",0,true];
} else {
	player setVariable ["blood",_blood,true];
};