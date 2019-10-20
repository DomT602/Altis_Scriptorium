/*
	File: fn_spawnAnimal.sqf
	Author: Dom
	Description: Spawns a random animal
*/
params [
	["_number",1,[0]]
];

[
	{
		params ["_number"];
		private _origin = getMarkerPos "Hunting_Zone";
		private _animals = ["Sheep_random_F","Goat_random_F","Hen_random_F","Cock_random_F","Rabbit_F"];

		for "_i" from 1 to _number do {
			private _type = selectRandom _animals;
			private _position = _origin getPos [250 * sqrt random 1, random 360];
			private _animal = createAgent [_type,_position,[],0,"FORM"]; //trying form?
			_animal setDir (random 360);
			_animal addEventHandler ["killed",{_this call server_fnc_animalKilled}];
		};
	},
	_number,
	60
] call CBA_fnc_waitAndExecute;