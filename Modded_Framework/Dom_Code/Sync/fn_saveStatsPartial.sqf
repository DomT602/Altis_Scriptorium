/*
	File: fn_saveStatsPartial.sqf
	Author: Dom
	Description: Sends a packet to the server to save in the DB.
*/
params [
	["_mode",-1,[0]]
];
if (_mode isEqualTo -1) exitWith {};
private _packet = [getPlayerUID player,_mode];

switch _mode do {
	case 0: {
		_packet pushBack client_cash;
		_packet pushBack client_bank;
	};
	
	case 1: {
		private _array = [];
		{
			private _varName = format["license_%1",(getText(missionConfigFile >> "Licenses" >> (configName _x) >> "variable"))];
			_array pushBack [_varName,missionNamespace getVariable [_varName,false]]; 
		} forEach ("true" configClasses (missionConfigFile >> "Licenses"));
		_packet pushBack _array;
	};
	case 2: {
		_packet pushBack (getUnitLoadout player);
		_packet pushBack (player getVariable ["faction","civ"]);
	};
	case 3: {
		_packet pushBack (player getVariable ["jail_details",[]]);
	};
	case 4: {
		_packet pushBack ([player getVariable ["hunger",100],player getVariable ["thirst",100],phone_battery,player getVariable ["blood",5000],player getVariable ["injuries",[]]]);
	};
	case 5: {
		_packet pushBack phone_settings;
		_packet pushBack phone_contacts;
	};
	case 6: {
		_packet pushBack [exp_woodcutting,exp_mining,exp_farming,exp_fishing,exp_hunting];
	};
};

_packet remoteExecCall ["DB_fnc_saveStatsPartial",2];