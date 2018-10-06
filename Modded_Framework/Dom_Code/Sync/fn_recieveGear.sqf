/*
    File: fn_recieveGear.sqf
    Author: Dom
    Description: Recieves faction gear
*/
params [
	["_gear",[],[[]]],
	["_faction","",[""]],
	["_department","",[""]]
];

player setVariable ["faction",_faction,true];
if (_department isEqualTo "") then {
	player setVariable ["department",nil,true];
} else {
	player setVariable ["department",_department,true];
};

if (_gear isEqualTo []) then {
	call DT_fnc_defaultLoadout;
} else {
	player setUnitLoadout [_gear,false];
};

switch _faction do {
	case "cop": {
		player setVariable ["copLevel",1,true];
		switch (player getVariable ["cop_rank",0]) do {
			case 1: {client_paycheck = 1000}; //Cadet
			case 2: {client_paycheck = 1250}; //Officer
			case 3: {client_paycheck = 1500}; //Corporal
			case 4: {client_paycheck = 1750}; //Sergeant
			case 5: {client_paycheck = 2000}; //Lieutenant
			case 6: {client_paycheck = 2250}; //Captain
			case 7: {client_paycheck = 2500}; //Chief
			default {client_paycheck = 1000}; //Default
		};
		["You have signed on as a Police Officer.","blue"] call DT_fnc_notify;
	};
	case "medic": {
		switch (player getVariable ["medic_rank",0]) do {
			case 1: {client_paycheck = 1000}; //Probie
			case 2: {client_paycheck = 1250}; //EMT
			case 3: {client_paycheck = 1500}; //Adv. EMT
			case 4: {client_paycheck = 1750}; //Paramedic
			case 5: {client_paycheck = 2000}; //Lieutenant
			case 6: {client_paycheck = 2250}; //Captain
			case 7: {client_paycheck = 2500}; //Commissioner
			default {client_paycheck = 1000}; //Default
		};  
		["You have signed on as a Medic.","blue"] call DT_fnc_notify;
	};
	case "civ": {
		switch (player getVariable ["doj_rank",0]) do {
			case 0: {client_paycheck = 500}; // Civ
			case 1: {client_paycheck = 1000}; // State Prosecutor
			case 2: {client_paycheck = 1500}; // DA
			case 3: {client_paycheck = 1500}; // Judge
			case 4: {client_paycheck = 2000}; // Justice 
		    case 5: {client_paycheck = 2500}; // Chief Justice 
		    default {client_paycheck = 500}; //Default
		};
	};
};

//[] call DT_fnc_setupPhone;