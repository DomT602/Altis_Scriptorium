/*
	File: fn_saveStatsPartial.sqf
	Author: Dom
	Description: Recieves request from client to update specific values
*/
params [
	["_uid","",[""]],
	["_mode",-1,[0]],
	["_data",-1,[0,[],objNull]]
];
if (_uid isEqualTo "") exitWith {};

switch _mode do {
	case 0: {
		[format["updateLicenses:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
	};

	case 1: {
		private _gear = getUnitLoadout _data;
		private _side = _data getVariable ["faction",""];
		switch _side do {
			case "cop": {[format["updateCopGear:%1:%2",_gear,_uid],1] call MySQL_fnc_DBasync};
			case "medic": {[format["updateMedicGear:%1:%2",_gear,_uid],1] call MySQL_fnc_DBasync};
			case "civ": {[format["updateCivGear:%1:%2",_gear,_uid],1] call MySQL_fnc_DBasync};
		};
	};

	case 2: {
		[format["updatePhoneSettings:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
	};

	case 3: {
		[format["updatePhoneContacts:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
	};
};