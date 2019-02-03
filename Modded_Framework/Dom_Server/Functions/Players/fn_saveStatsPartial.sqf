/*
	File: fn_saveStatsPartial.sqf
	Author: Dom
	Description: Recieves request from client to update specific values
*/

params [
	["_uid","",[""]],
	["_mode",-1,[0]],
	["_data",-1,[0,[],false]],
	["_aditData",-1,[0,[],""]]
];

if (_uid isEqualTo "") exitWith {};

switch _mode do {
	case 0: {
		[format["updateMoney:%1:%2:%3",_data,_aditData,_uid],1] call MySQL_fnc_DBasync;
	};

	case 1: {
		[format["updateLicenses:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
	};

	case 2: {
		switch _aditData do {
			case "cop": {[format["updateCopGear:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync};
			case "medic": {[format["updateMedicGear:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync};
			case "civ": {[format["updateCivGear:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync};
		};
	};

	case 3: {
		[format["updateJail:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
	};

	case 4: {
		[format["updateStats:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
	};

	case 5: {
		[format["updatePhone:%1:%2:%3",_data,_aditData,_uid],1] call MySQL_fnc_DBasync;
	};

	case 6: {
		[format["updateSkills:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
	};
};