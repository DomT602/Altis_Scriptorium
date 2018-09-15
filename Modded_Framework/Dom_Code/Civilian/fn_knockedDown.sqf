/*
	File: fn_knockedDown.sqf
	Author: Dom
	Description: Handles getting hit by the tazer or beanbag shotgun or hands
*/
params [
	["_weapon","",[""]]
];
if (_weapon isEqualTo "") exitWith {};

if (_weapon isEqualTo "Taser_26" || _weapon isEqualTo "Hands") exitWith {
	client_blockActions = true;
	player allowDamage false;
	private _obj = "Land_Can_V3_F" createVehicleLocal [0,0,0];
	_obj setMass 1e10;
	_obj attachTo [player, [0,0,0], "Spine3"];
	_obj setVelocity [0,0,6];
	player allowDamage false;
	player setFatigue 1;
	detach _obj;
	[_obj] spawn {
		params ["_obj"];
		uiSleep 0.75;
		deleteVehicle _obj;
		player allowDamage true;
		uiSleep 3;
		client_blockActions = false;
	}; //animation called 'unconscious'

};

if (_weapon isEqualTo "prpl_benelli_14_pgs_rail") exitWith {
	player playMove "AinjPfalMstpSnonWnonDf_carried_fallwc";
	sleep 15;
	[player,""] remoteExecCall ["switchMove",-2];
	player setFatigue 1;
};
