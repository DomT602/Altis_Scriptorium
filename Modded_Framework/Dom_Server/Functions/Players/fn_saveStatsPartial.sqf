/*
	File: fn_saveStatsPartial.sqf
	Author: Dom
	Description: Recieves request from client to update specific values
*/
params [
	["_unit",objNull,[objNull]],
	["_mode",-1,[0]],
	["_data",-1,[0,[]]]
];
if (isNull _unit) exitWith {};
private _uid = getPlayerUID _unit;

switch _mode do {
	case 0: {
		[format["updateLicenses:%1:%2",_data,_uid],1] call MySQL_fnc_DBasync;
	};

	case 1: {
		private _gear = getUnitLoadout _unit;
		private _side = _unit getVariable ["faction",""];
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