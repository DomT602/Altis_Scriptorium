/*
	File: fn_robStore.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Robs a store, variables can be customized via the NPC init line
	NPC init line format: this addAction["Rob Store",DT_fnc_robStore,[totalAttempts,totalTime,totalFunds,"store name"]];
				e.g: this addAction["Rob Store",DT_fnc_robStore,[10,50,15000,"Kavala General Store"]];
*/
params [
	["_target",objNull,[objNull]],
	["_caller",objNull,[objNull]],
	["_ID",-1,[0]],
	["_arguments",[10,50,500,""],[[]]]
];
if (isNull _target || {isNull _caller} || {_ID isEqualTo -1}) exitWith {};

_arguments params [
    ["_attempts",10,[0]],
	["_totalTime",50,[0]],
	["_totalCash",500,[0]],
	["_name","",[""]]
];

if (["cop",true] call DT_fnc_countFaction < 4) exitWith {["Not enough police presence.","orange"] call DT_fnc_notify};
if (currentWeapon player isEqualTo "" || {currentWeapon player isEqualTo "Binocular"} || {currentWeapon player isEqualTo "Rangefinder"} || {!isNull objectParent player}) exitWith {};

private _time = round(_totalTime / _attempts);
private _cash = round(_totalCash / _attempts);

["Robbery begun, stay near the cashier to recieve your money."] call DT_fnc_notify;
private _units = ["cop"] call DT_fnc_findPlayers;
[format["Robbery in progress at %1.",_name],"red"] remoteExecCall ["DT_fnc_notify",_units];
_target removeAction _ID;

for "_i" from 0 to _totalTime step 1 do {
	uiSleep 1;
	if (player getVariable ["dead",false]) exitWith {};
    if (player distance _target >= 10 || {!isNull objectParent player} || {currentWeapon player isEqualTo ""} || {currentWeapon player isEqualTo "Binocular"} || {currentWeapon player isEqualTo "Rangefinder"}) exitWith {
        ["Robbery stopped","red"] call DT_fnc_notify;
    };
    if ((_i mod _attempts) isEqualTo 0) then {
    	_cash = _cash + round(random(_cash / 25));
    	client_cash = client_cash + _cash;
    	[format["You stole %1.",_cash]] call DT_fnc_notify;
    };
};

if !(player getVariable ["dead",false]) then {
	uiSleep _totalTime;
	[0] call DT_fnc_saveStatsPartial;
};
_target addAction["Rob Store",DT_fnc_robStore,[_attempts,_totalTime,_totalCash,_name]];