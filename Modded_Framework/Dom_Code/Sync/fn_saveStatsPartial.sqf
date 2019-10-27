/*
	File: fn_saveStatsPartial.sqf
	Author: Dom
	Description: Sends a packet to the server to save in the DB.
*/
params [
	["_mode",-1,[0]]
];
if (_mode isEqualTo -1) exitWith {};
private _packet = [player,_mode];

switch _mode do {
	case 0: {
		_packet pushBack client_licenses;
	};
	case 1: {
		//gear
	};
	case 2: {
		_packet pushBack phone_settings;
	};
	case 3: {
		_packet pushBack phone_contacts;
	};
};

_packet remoteExecCall ["DB_fnc_saveStatsPartial",2];