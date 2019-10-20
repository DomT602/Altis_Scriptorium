/*
	File: fn_respawnRock.sqf
	Author: Dom
	Description: Respawns a rock for mining
*/
params [
	["_origin",[],[[]]],
	["_count",1,[0]]
];

private _rockTypes = ["rock_1","rock_2"];

for "_i" from 1 to _count do {
	private _position = _origin getPos [50 * sqrt random 1, random 360];
	private _rock = createVehicle [(selectRandom _rockTypes),_position,[],0,"CAN_COLLIDE"];
	_rock addEventHandler ["handleDamage",{_this call server_fnc_rockHandleDamage}];
	_rock setVariable ["health",50,false];
	_rock setDir (random 360);
};

