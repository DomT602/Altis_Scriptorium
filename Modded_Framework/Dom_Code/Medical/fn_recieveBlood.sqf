/*
	File: fn_recieveBlood.sqf
	Author: Dom
	Description: Slowly increases blood level of the player
*/
params [
	["_amount",0,[0]]
];

for "_i" from 0 to 20 step 1 do {
	private _blood = player getVariable ["blood",100];
	_blood = _blood + 100;
	if (_blood > 5000) exitWith {player setVariable ["blood",5000,true]};
	player setVariable ["blood",_blood,true];
	uiSleep 2;
};