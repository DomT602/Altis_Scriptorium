/*
	File: fn_healthHandler.sqf
	Author: Dom
	Description: Handles damage to body parts & blood
*/
params [
	["_part",0,[0]],
	["_damage",0,[0]]
];
if (_damage isEqualTo 0) exitWith {};
_damage = parseNumber (_damage toFixed 2);

private _injuries = player getVariable ["injuries",[]];
private _bleeds = player getVariable ["bleeding",[]];

if (_part isEqualTo -1) then {
	{
		_injuries set [_forEachIndex,(_x + _damage) min 1];
		if ((_bleeds select _forEachIndex) isEqualTo 0 && {(round(random 5)) isEqualTo 5}) then {
			_bleeds set [_forEachIndex,1];
		};
	} forEach _injuries;
	player setVariable ["bleeding",_bleeds,true];
} else {
	private _injuryValue = _injuries select _part;
	if (_injuryValue isEqualTo 1) exitWith {};
	_injuryValue = (_injuryValue + _damage) min 1;
	_injuries set [_part,_injuryValue];
	if ((_bleeds select _part) isEqualTo 0 && {(round(random 5)) isEqualTo 5}) then {
		_bleeds set [_part,1];
		player setVariable ["bleeding",_bleeds,true];
	};
};
player setVariable ["injuries",_injuries,true];

if (player getVariable ["dead",false]) exitWith {};

private _blood = player getVariable ["blood",5000];
private _damage = round(_damage * 550);
_blood = (_blood - _damage) max 0;
//systemChat format["Blood damage: %1 and new blood level: %2",_damage,_blood];
player setVariable ["blood",_blood,true];
["blood"] call DT_fnc_updateHUDPartial;
if (_blood isEqualTo 0 || ((player getVariable ["injuries",[]] select 0) isEqualTo 1)) then {
	[player] call DT_fnc_onPlayerKilled;
};