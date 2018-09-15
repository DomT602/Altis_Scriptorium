#include "\Dom_Code\script_macros.hpp"
/*
    File: fn_saveStatsFull.sqf
	Author: Dom
	Description: Sends a packet to the server with all player info to save to DB.
*/

private _packet = [getPlayerUID player,profileName,player getVariable ["faction","civ"],CASH,BANK];

private _array = [];
{
    private _varName = format["license_%1",(getText(missionConfigFile >> "Licenses" >> (configName _x) >> "variable"))];
    _array pushBack [_varName,missionNamespace getVariable [_varName,0]]; 
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));
_packet pushBack _array;

call DT_fnc_saveGear; //getUnitLoadout player;
_packet pushBack client_gear;

_packet pushBack ([player getVariable ["hunger",100],player getVariable ["thirst",100],phone_battery,player getVariable ["blood",5000],player getVariable ["head",0],player getVariable ["torso",0],player getVariable ["arms",0],player getVariable ["legs",0]]);

_packet pushBack (player getVariable ["jail_details",[]]);
_packet pushBack (getPosATL player);
_packet pushBack phone_settings;
_packet pushBack phone_contacts;
_packet pushBack ([exp_woodcutting,exp_mining,exp_farming,exp_fishing,exp_hunting]);

_packet remoteExecCall ["DB_fnc_saveStatsFull",2];