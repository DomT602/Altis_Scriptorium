/*
	File: fn_recieveBlood.sqf
	Author: Dom
	Description: Slowly increases blood level of the player
*/
params [
	["_amount",0,[0]]
];

[
	{
		params ["_arguments"];
		_arguments params ["_count","_amount"];
		if (_blood isEqualTo 5000) exitWith {};
		private _blood = player getVariable ["blood",100];
		_blood = (_blood + _amount) min 5000;
		player setVariable ["blood",_blood,true];
		["blood"] call DT_fnc_updateHUDPartial;
		if (_count isEqualTo 0) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};
		_arguments set [0,(_count - 1)];
	},
	2.5,
	[20,_amount]
] call CBA_fnc_addPerFrameHandler;