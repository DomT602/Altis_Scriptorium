/*
	File: fn_spawnAnimal.sqf
	Author: Dom
	Description: Spawns a random animal
*/

params [
	["_number",1,[0]]
];

private _origin = getMarkerPos "Hunting_Zone";
private _animals = ["Sheep_random_F","Goat_random_F","Hen_random_F","Cock_random_F","Rabbit_F"];

for "_i" from 0 to _number do {
	private _type = selectRandom _animals;
	private _position = _origin getPos [200 * sqrt random 1, random 360];
	//_position set [2,0];
	private _animal = createAgent [_type,_position,[],0,"FORM"];
	_animal setDir (random 360);
	_animal addEventHandler ["handleDamage",{_this call server_fnc_animalHandleDamage}];
};