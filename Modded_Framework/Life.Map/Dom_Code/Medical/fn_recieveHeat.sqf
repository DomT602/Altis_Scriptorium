/*
	File: fn_recieveHeat.sqf
	Author: Dom
	Description: Slowly increases heat level of the player
*/
params [
	["_amount",0,[0]],
	["_item","",[""]]
];

private _temp = player getVariable ["bodyTemp",37];
if ((_temp > 38 && _item isEqualTo "D_Heatpack_i") || (_temp < 36 && _item isEqualTo "D_Icepack_i")) then {
	_amount / 2;
};
[
	{
		params ["_arguments"];
		_arguments params ["_count","_amount"];
		private _temp = player getVariable ["bodyTemp",37];
		if (_temp > 38.5 && {_temp < 35.5}) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};
		_temp = _temp + _amount;
		player setVariable ["bodyTemp",_temp,true];
		if (_count isEqualTo 0) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler};
		_arguments set [0,(_count - 1)];
	},
	2,
	[15,(_amount / 15)]
] call CBA_fnc_addPerFrameHandler;