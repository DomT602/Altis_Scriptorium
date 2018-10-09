/*
    File: fn_saveStatsPartial.sqf
	Author: Dom
	Description: Sends a packet to the server to save in the DB.
*/
params [
	["_mode",-1,[0]]
];
if (_mode isEqualTo -1) exitWith {};
private _packet = [getPlayerUID player,player getVariable ["faction","civ"],_mode];
private _array = [];

switch _mode do {
	case 0: {
		_packet pushBack client_cash;
		_packet pushBack client_bank;
	};
	
	case 1: {
		{
		    private _varName = format["license_%1",(getText(missionConfigFile >> "Licenses" >> (configName _x) >> "variable"))];
		    _array pushBack [_varName,missionNamespace getVariable [_varName,0]]; 
		} forEach ("true" configClasses (missionConfigFile >> "Licenses"));
	};
	
	case 2: {
		_packet pushBack (getUnitLoadout player);
	};
	
	case 3: {
        _packet pushBack (getPosATL player);
	};
	
	case 4: {
		private _details = player getVariable ["jail_details",[]];
		_packet pushBack _details;
	};
	
	case 5: {
		_packet pushBack ([player getVariable ["hunger",100],player getVariable ["thirst",100],phone_battery,player getVariable ["blood",5000],player getVariable ["head",0],player getVariable ["torso",0],player getVariable ["arms",0],player getVariable ["legs",0]]);
    };
    case 6: {
    	_packet pushBack phone_settings;
    	_packet pushBack phone_contacts;
	};
	case 7: {
		_packet pushBack [exp_woodcutting,exp_mining,exp_farming,exp_fishing,exp_hunting];
	};
};

_packet remoteExecCall ["DB_fnc_saveStatsPartial",2];