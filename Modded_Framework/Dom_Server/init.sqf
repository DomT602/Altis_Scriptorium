/*
	File: init.sqf
	Author: Dom
	Description: Begins initialisation for serverside stuff
*/

["DT_DB"] call MYSQL_fnc_DBinit;
[] call compile preprocessFileLineNumbers "\Dom_Code\init.sqf";

phone_backgrounds = [//background name, path
	["",""]
];
publicVariable "phone_backgrounds";

mod_list = [];
{
	mod_list pushBack (configName _x);
} forEach ("true" configClasses (configFile >> "CfgPatches"));
publicVariable "mod_list";
mod_list = nil;

addMissionEventHandler ["HandleDisconnect",{_this call server_fnc_onClientDisconnect; false}];

["resetPositions",1] call MySQL_fnc_DBasync;
["resetVehicles",1] call MySQL_fnc_DBasync;
(["selectPersisVars",2] call MySQL_fnc_DBasync) params [
	["_threat","Green",[""]],
	["_mayor","Aquarium",[""]],
	["_tax",[0,0,0],[[]]],
	["_bank",0,[0]]
];
_tax params ["_atmTax","_itemTax","_vehTax"];
gov_bank = _bank;

call DB_fnc_initHousing;
call DB_fnc_initShops;
[3] call DB_fnc_fetchData;
call DB_fnc_populateCompanies;

[(50 + round(random 50))] call server_fnc_spawnAnimal; //could add killed EVH to decide what quality meat id drops?

//vars here
jail_bomb_planted = false;
publicVariable "jail_bomb_planted";
threat_level = _threat;
publicVariable "threat_level";
mayor = _mayor;
publicVariable "mayor";
//rebel_use = true;
//publicVariable "rebel_use";
//rebel_started = false;
//publicVariable "rebel_started";
//rebel_time = time;
//publicVariable "rebel_time";

[] spawn server_fnc_monitorServer;
