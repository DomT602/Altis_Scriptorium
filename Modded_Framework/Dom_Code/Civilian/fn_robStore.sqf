/*
	File: fn_robStore.sqf
	Author: Dom
	Description: Robs a store, variables can be customized via the NPC init line
*/
params [
	["_target",objNull,[objNull]]
];
if (isNull _target) exitWith {};

(_target getVariable ['robStore',[]]) params [
	["_attempts",10,[0]],
	["_totalTime",50,[0]],
	["_name","",[""]]
];

if (["cop",true] call DT_fnc_countFaction < 4) exitWith {["Not enough police presence.","orange"] call DT_fnc_notify};
if (currentWeapon player in ["","Binocular","Rangefinder"] || {!isNull objectParent player}) exitWith {};
if (CBA_missionTime - (_target getVariable ["timer",0]) < (_totalTime * 3)) exitWith {["This shop was recently robbed and has no cash left!","red"] call DT_fnc_notify};

private _randomCash = 50 + round(random 25);

["Robbery begun, stay near the cashier to recieve your money."] call DT_fnc_notify;
_target setVariable ["timer",CBA_missionTime,true];
private _array = [];
{
	if (count _array isEqualTo 2) exitWith {};
	if !(_x isEqualTo "") then {_array pushBack (([_x] call DT_fnc_fetchDetails) select 0)};
} forEach ([uniform player,vest player,backpack player,headgear player,goggles player] call BIS_fnc_arrayShuffle);
_target setVariable ["evidence",_array,true];
private _units = ["cop"] call DT_fnc_findPlayers;
[format["Robbery in progress at %1.",_name],"red"] remoteExecCall ["DT_fnc_notify",_units];

for "_i" from 0 to _totalTime do {
	uiSleep 1;
	if (player getVariable ["dead",false]) exitWith {};
	if (player distance _target >= 10 || {!isNull objectParent player} || {currentWeapon player in ["","Binocular","Rangefinder"]}) exitWith {
		["Robbery stopped.","red"] call DT_fnc_notify;
	};
	if ((_i mod _attempts) isEqualTo 0) then {
		private _vendorCash = _target getVariable ["funds",0];
		private _extraCash = floor(_vendorCash / _attempts);
		private _cash = _randomCash + _extraCash;
		["cash",_cash] call DT_fnc_handleMoney;
		_target setVariable ["funds",(_vendorCash - _extraCash) max 0,true];
		[format["You stole $%1.",_cash],"blue",((_totalTime / _attempts) - 3)] call DT_fnc_notify;
	};
	if (_i isEqualTo _totalTime) then {
		["Robbery completed.","green"] call DT_fnc_notify;
	};
};