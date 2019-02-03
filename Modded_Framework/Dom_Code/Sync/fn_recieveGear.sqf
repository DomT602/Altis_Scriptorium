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
		client_paycheck = switch (player getVariable ["cop_rank",0]) do {
			case 1: {1000};
			case 2: {1250};
			case 3: {1500};
			case 4: {1750};
			case 5: {2000};
			case 6: {2250};
			case 7: {2500};
		};
		["You have signed on as a Police Officer.","blue"] call DT_fnc_notify;
	};
	case "medic": {
		client_paycheck = switch (player getVariable ["medic_rank",0]) do {
			case 1: {1000};
			case 2: {1250};
			case 3: {1500};
			case 4: {1750};
			case 5: {2000};
			case 6: {2250};
			case 7: {2500};
		};  
		["You have signed on as a Medic.","blue"] call DT_fnc_notify;
	};
	case "civ": {
		client_paycheck = switch (player getVariable ["doj_rank",0]) do {
			case 0: {0};
			case 1: {1000};
			case 2: {1500};
			case 3: {1500};
			case 4: {2000};
		    case 5: {2500};
		};
	};
};

//[] call DT_fnc_setupPhone;