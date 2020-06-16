/*
	File: fn_knockedDown.sqf
	Author: Dom
	Description: Handles getting hit by the tazer or beanbag shotgun or hands
*/
params [
	["_weapon","",[""]]
];
if (_weapon isEqualTo "") exitWith {};

if (_weapon isEqualTo "Taser_26" || _weapon isEqualTo "hands") exitWith {
	client_blockActions = true;
	player allowDamage false;
	disableUserInput true;
	{
		detach _x;
	} forEach attachedObjects player;
	private _obj = "Land_Can_V3_F" createVehicleLocal [0,0,0];
	_obj setMass 1e10;
	_obj attachTo [player, [0,0,0], "Spine3"];
	_obj setVelocity [0,0,6];
	player setFatigue 1;
	detach _obj;
	[
		{
			deleteVehicle _this; 
			[
				{disableUserInput false; player allowDamage true},
				0,
				0.75
			] call CBA_fnc_waitAndExecute;
			[
				{client_blockActions = false},
				0,
				3
			] call CBA_fnc_waitAndExecute;
		},
		_obj
	] call CBA_fnc_execNextFrame; //animation called 'unconscious'
};