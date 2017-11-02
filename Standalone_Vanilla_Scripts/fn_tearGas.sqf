/*
	File: fn_tearGas.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Uses a yellow smoke grenade as teargas, if your wearing a mask, you are not affected by it, this can be customised by chaning ppeffect values, and camera shake values
    To-do: Place file where you want (default core/cop), add to functions.hpp
    Add this to fn_onFired.sqf:
    if (_ammoType isEqualTo "SmokeShellYellow") then {
        [_projectile] remoteExec ["life_fnc_teargas",-2];
    };
    Add this to CfgRemoteExec
    F(life_fnc_tearGas,CLIENT)
*/
params [
    ["_projectile",objNull,[objNull]]
];

waitUntil {_projectile distance player < 20 || isNull _projectile};
if (isNull _projectile) exitWith {};
private _masks = ["H_Shemag_olive"]; //define masks which you want to block the effect of teargas here

while {!isNull _projectile} do {
    if(_projectile distance player < 10 && !((headgear player) in _masks || (goggles player) in _masks)) then {
        "dynamicBlur" ppEffectEnable true;
        "dynamicBlur" ppEffectAdjust [20];
        "dynamicBlur" ppEffectCommit 3;
        enableCamShake true;
        addCamShake [10,20,5];
        player setFatigue 1;
        if !(life_fadeSound) then {
            5 fadeSound 0.1;
        };
    } else {
        "dynamicBlur" ppEffectAdjust [0];
        "dynamicBlur" ppEffectCommit 10;
        if !(life_fadeSound) then {
            20 fadeSound 1;
        };
    };
    sleep 5;
};
sleep 5;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 10;
resetCamShake;
sleep 10;
"dynamicBlur" ppEffectEnable false;