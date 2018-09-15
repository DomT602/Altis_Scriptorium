/*
	File: fn_tearGas.sqf
	Author: Dom
	Description: Uses a yellow smoke grenade as teargas
*/
params [
    ["_projectile",objNull,[objNull]]
];

waitUntil {_projectile distance player < 20 || isNull _projectile};
if (isNull _projectile) exitWith {};
private _masks = ["H_Shemag_olive"];

while {!isNull _projectile} do {
    if (_projectile distance player < 10 && !((headgear player) in _masks || (goggles player) in _masks)) then {
        "dynamicBlur" ppEffectEnable true;
        "dynamicBlur" ppEffectAdjust [20];
        "dynamicBlur" ppEffectCommit 3;
        enableCamShake true;
        addCamShake [10,20,5];
        player setFatigue 1;
    } else {
        "dynamicBlur" ppEffectAdjust [0];
        "dynamicBlur" ppEffectCommit 10;
    };
    sleep 5;
};
sleep 5;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 10;
resetCamShake;
sleep 10;
"dynamicBlur" ppEffectEnable false;