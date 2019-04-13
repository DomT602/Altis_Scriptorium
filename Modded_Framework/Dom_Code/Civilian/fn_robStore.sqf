/*
	File: fn_robStore.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Robs a store, variables can be customized via the NPC init line
	NPC init line format: this addAction["Rob Store",DT_fnc_robStore,[totalAttempts,totalTime,"store name"]];
*/
params [
	["_target",objNull,[objNull]],
	["_arguments",[10,50,""],[[]]]
];
if (isNull _target) exitWith {};

_arguments params [
	["_attempts",10,[0]],
	["_totalTime",50,[0]],
	["_name","",[""]]
];

if (["cop",true] call DT_fnc_countFaction < 0) exitWith {["Not enough police presence.","orange"] call DT_fnc_notify};
if (currentWeapon player in ["","Binocular","Rangefinder"] || {!isNull objectParent player}) exitWith {};
if (time - (_target getVariable ["timer",0]) < (_totalTime * 3)) exitWith {["You can't rob this shop again so soon.","red"] call DT_fnc_notify};

private _time = round(_totalTime / _attempts);
private _randomCash = 50 + round(random 25);

["Robbery begun, stay near the cashier to recieve your money."] call DT_fnc_notify;
_target setVariable ["timer",time,false];
private _units = ["cop"] call DT_fnc_findPlayers;
[format["Robbery in progress at %1.",_name],"red"] remoteExecCall ["DT_fnc_notify",_units];

for "_i" from 0 to _totalTime step 1 do {
	uiSleep 1;
	if (player getVariable ["dead",false]) exitWith {};
	if (player distance _target >= 10 || {!isNull objectParent player} || {currentWeapon player in ["","Binocular","Rangefinder"]}) exitWith {
		["Robbery stopped.","red"] call DT_fnc_notify;
	};
	if ((_i mod _attempts) isEqualTo 0) then {
		private _vendorCash = _target getVariable ["funds",0];
		private _extraCash = floor(_vendorCash / _attempts);
		private _cash = _randomCash + _extraCash;
		client_cash = client_cash + _cash;
		_target setVariable ["funds",(_vendorCash - _extraCash) max 0,true];
		[0] call DT_fnc_saveStatsPartial;
		[format["You stole $%1.",_cash]] call DT_fnc_notify;
	};
	if (_i isEqualTo _totalTime) then {
		["Robbery completed.","green"] call DT_fnc_notify;
	};
};