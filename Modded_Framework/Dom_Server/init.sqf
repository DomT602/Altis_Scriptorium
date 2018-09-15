/*
	File: init.sqf
	Author: Dom
	Description: Begins initialisation for serverside stuff
*/

["DT_DB"] call MYSQL_fnc_DBinit;
[] call compile preprocessFileLineNumbers "\Dom_Code\init.sqf";

traffic_lightsA = []; //populate via EVH in e76 roads or search for all terrain objects of certain type
traffic_lightsB = [];
counter = 0;
phone_backgrounds = [//background name, path
	["",""]
];
publicVariable "phone_backgrounds";

addMissionEventHandler ["HandleDisconnect",{_this call server_fnc_onClientDisconnect; false}];

["resetPositions",1] call MySQL_fnc_DBasync;
["resetVehicles",1] call MySQL_fnc_DBasync;
["deleteOldCompanies",1] call MySQL_fnc_DBasync;
(["selectPersisVars",2] call MySQL_fnc_DBasync) params [
	["_threat","Green",[""]],
	["_mayor","Aquarium",[""]],
	["_tax",[0,0,0],[[]]],
	["_bank",0,[0]]
];
_tax params ["_atmTax","_itemTax","_vehTax"];
gov_bank = _bank;

[3] call DB_fnc_fetchData;
call DB_fnc_populateCompanies;

[(50 + round(random 50))] call server_fnc_spawnAnimal; //could add killed EVH to decide what quality meat id drops?

//vars here
jail_bomb_planted = false;
publicVariable "jail_bomb_planted";
threat_level = _threat;
publicVariable "threat_level";
mayor = _mayor;
publicVariable mayor;
rebel_use = true;
publicVariable rebel_use;
rebel_started = false;
publicVariable rebel_started;
rebel_time = time;
publicVariable rebel_time;

[] spawn server_fnc_monitorServer;

/*
class EventHandlers
		{
			init = "if !(isNil 'traffic_lightsA') then {traffic_lightsA pushBack (_this select 0);";
		};
{
	_x animate ["switchred",0];
} forEach traffic_lightsB;

[
	{
		counter = counter + 1;
		if (counter in [2,3,7,8]) exitWith {};
		if (counter isEqualTo 1) exitWith {
			{
				_x animate ["switchred",1];
				_x animate ["switchyellow",1];
				_x animate ["switchgreen",0];
			} forEach traffic_lightsA;
		};
		if (counter isEqualTo 4) exitWith {
			{
				_x animate ["switchgreen",1];
				_x animate ["switchyellow",0];
			} forEach traffic_lightsA;
		};
		if (counter isEqualTo 5) exitWith {
			{
				_x animate ["switchyellow",1];
				_x animate ["switchred",0];
			} forEach traffic_lightsA;
			{
				_x animate ["switchyellow",0];
			} forEach traffic_lightsB;
		};
		if (counter isEqualTo 6) exitWith {
			{
				_x animate ["switchred",1];
				_x animate ["switchyellow",1];
				_x animate ["switchgreen",0];
			} forEach traffic_lightsB;
		};
		if (counter isEqualTo 9) exitWith {
			{
				_x animate ["switchgreen",1];
				_x animate ["switchyellow",0];
			} forEach traffic_lightsB;
		};
		if (counter isEqualTo 10) exitWith {
			counter = 0;
			{
				_x animate ["switchyellow",0];
			} forEach traffic_lightsA;
			{
				_x animate ["switchyellow",1];
				_x animate ["switchred",0];
			} forEach traffic_lightsB;
		};
	},
	3
] call CBA_fnc_addPerFrameHandler;*/