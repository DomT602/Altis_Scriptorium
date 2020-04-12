/*
	File: fn_repairMenu.sqf
	Author: Dom
	Description: Opens and populates the repair menu for cars
*/
params [
	["_vehicle",objNull,[objNull]]
];

if !([_vehicle,3] call DT_fnc_checkVehicle) exitWith {};
createDialog "DT_repairMenu";

private _LFwheel = _vehicle getHitPointDamage "HitLFWheel";
private _LBwheel = _vehicle getHitPointDamage "HitLF2Wheel";
private _RFwheel = _vehicle getHitPointDamage "HitRFWheel";
private _RBwheel = _vehicle getHitPointDamage "HitRF2Wheel";
private _engine = _vehicle getHitPointDamage "HitEngine";
private _fuelTank = _vehicle getHitPointDamage "HitFuel";

private _hull = 0;
{
	_hull = _hull + (_vehicle getHitPointDamage _x)
} forEach ["HitBody","HitHull","HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6"];
_hull = _hull / 8;

{
	private _path = switch _forEachIndex do {
		case 0: {"\Dom_UI\vehicle\hull_"};
		case 1: {"\Dom_UI\vehicle\engine_"};
		case 2: {"\Dom_UI\vehicle\fuelTank_"};
		default {"\Dom_UI\vehicle\wheel_"};
	};
	if (_x > 0) then { //default grey
		ctrlEnable [(-1 + _forEachIndex),true];
		if (_x > 0.25) then {
			if (_x > 0.75) then {
				_path = _path + "red.paa";
			} else {
				_path = _path + "orange.paa";
			};
		} else {
			_path = _path + "green.paa";
		};
		((findDisplay -1) displayCtrl (-1 + _forEachIndex)) ctrlSetText _path;
	} else {
		ctrlEnable [(-1 + _forEachIndex),false];
	};
} forEach [_hull,_engine,_fuelTank,_LFwheel,_LBwheel,_RFwheel,_RBwheel];