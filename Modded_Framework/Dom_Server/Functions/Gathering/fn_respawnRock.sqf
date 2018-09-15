/*
	File: fn_respawnROck.sqf
	Author: Dom
	Description: Respawns a rock for mining
*/

params [
	["_origin",[],[[]]]
];

private _rockTypes = ["normal","iron","coal"]; //etc
private _position = _origin getPos [50 * sqrt random 1, random 360];

private _rock = createVehicle ["rock",_position,[],0,"CAN_COLLIDE"];
_rock addEventHandler ["handleDamage",{_this call server_fnc_rockHandleDamage}];
_rock setVariable ["health",50,false];
_rock setVariable ["type",(selectRandom _rockTypes),false];
_rock setDir (random 360);