/*
	File: fn_bankRobbery.sqf
	Author: Dom
	Description: Handles stages of the bank robbery
*/
params [
	["_stage","",[""]],
	["_data",[],[[]]]
];

switch _stage do {
	case "openVault": { //data is centre of vault in ATL
		//open vault animation
		for "_i" from 1 to (4 max (round(count playableUnits / 10))) do {
			private _position = _data getPos [5 * sqrt random 1, random 360];
			private _pile = createVehicle ["Land_Money_F",_position,[],0,"NONE"];
			_pile setVariable ["cash",0,true]; //0 signifies bank cash
		};
	};	
};