/*
	File: fn_requestReceived.sqf
	Author: Dom
	Description: Recieves clients information and sets it up
*/
params [
	["_dbID",-1,[0]],
	["_cash",0,[0]],
	["_bank",0,[0]],
	["_coplevel",0,[0]],
	["_mediclevel",0,[0]],
	["_dojlevel",0,[0]],
	["_donorlevel",0,[0]],
	["_licenses",[],[[]]],
	["_jailDetails",[],[[]]],
	["_gear",[],[[]]],
	["_stats",[],[[]]],
	["_alive",0,[0]],
	["_position",[],[[]]],
	["_phoneNumber","",[""]],
	["_phoneContacts",[],[[]]],
	["_phoneSettings",[],[[]]],
	["_skills",[],[[]]],
	["_companyData",[],[[]]],
	["_houses",[],[[]]],
	["_keys",[],[[]]]
];

player setVariable ["DBid",_dbID,true];
client_cash = _cash;
client_bank = _bank;
player setVariable ["cop_rank",_coplevel,true];
player setVariable ["medic_rank",_mediclevel,true];
player setVariable ["doj_rank",_dojlevel,true];
player setVariable ["donor_level",_donorlevel,true];

{
	_x params ["_name","_bool"];
	missionNamespace setVariable [_name,_bool];
} forEach _licenses;

player setVariable ["jail_details",_jailDetails,true];

if (_gear isEqualTo []) then {
	call DT_fnc_defaultLoadout;
} else {
	player setUnitLoadout [_gear,false];
};

_stats params ["_hunger","_thirst","_battery","_blood","_injuries"];
player setVariable ["hunger",_hunger,true];
player setVariable ["thirst",_thirst,true];
phone_battery = _battery;
player setVariable ["blood",_blood,true];
player setVariable ["injuries",_injuries,true];
if (_blood isEqualTo 0) then {[player,"Combat Logged",true] remoteExecCall ["server_fnc_logAction",2]; [player] call DT_fnc_onPlayerKilled};

player setVariable ["phoneNumber",_phoneNumber,true];
phone_contacts = _phoneContacts;
phone_settings = _phoneSettings;
//phone_settings params ["_mode","_background","_ringTone"];
_skills params ["_woodcutting","_mining","_farming","_fishing","_hunting"];
exp_woodcutting = _woodcutting;
exp_mining = _mining;
exp_farming = _farming;
exp_fishing = _fishing;
exp_hunting = _hunting;

if !(_companyData isEqualTo []) then {
	_companyData params ["_name","_rank","_rankName","_salary"]; //salary not put in yet
	player setVariable ["company",_name,true];
	player setVariable ["company_rank",_rank,true];
	player setVariable ["company_position",_rankName,false];
};

{
	client_keys pushBack _x;
	private _marker = createMarkerLocal [format ["house_%1",_forEachIndex],_x];
	_marker setMarkerTextLocal (getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName"));
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
} forEach _houses;

{
	client_keys pushBack _x
} forEach _keys;

//Lets setup the rest of the players stuff here
player addEventHandler ["HandleDamage", {_this call DT_fnc_handleDamage}];
player addEventHandler ["FiredMan", {_this call DT_fnc_onFired}];
player addEventHandler ["InventoryClosed", {_this call DT_fnc_onInventoryClosed}];
player addEventHandler ["InventoryOpened", {_this call DT_fnc_onInventoryOpened}];
player addEventHandler ["HandleRating", {0}];
player addEventHandler ["HandleScore", {false}];
player addEventHandler ["GetOutMan",{_this call DT_fnc_onGetOutMan}];
player addEventHandler ["Put",{[2] call DT_fnc_saveStatsPartial}];
addMissionEventHandler ["Map", {_this call DT_fnc_checkMap}];
addMissionEventHandler ["Draw3D",{call DT_fnc_playerTags}];

for "_i" from 0 to (15 - 1) do {
	DT_notifArray pushBack ["",-1];
};

cutText ["","PLAIN",1];
658 cutRsc ["DT_HUD","PLAIN",-1,false];
659 cutRsc ["DT_Notifications","PLAIN"];

call DT_fnc_exploitBlocker;
//call DT_fnc_TFARcheck;
call DT_fnc_medicalLoop;
call DT_fnc_survivalLoop;	
call DT_fnc_setupHUD;

if (_jailDetails select 0) then {
	player setVehiclePosition [(getMarkerPos "Jail_Spawn"),[],0,"CAN_COLLIDE"];
	call DT_fnc_jailTimer;
} else {
	if (_alive isEqualTo 1) then {
		player setVehiclePosition [_position,[],0,"CAN_COLLIDE"];
	} else {
		if (_houses isEqualTo []) then {
			player setVehiclePosition [(getMarkerPos "Lakeside_Spawn"),[],0,"CAN_COLLIDE"];
		} else {
			private _spawnHouse = nearestObject [(selectRandom _houses),"House"];
			_spawnHouse = _spawnHouse buildingPos 0;
			player setVehiclePosition [_spawnHouse,[],0,"CAN_COLLIDE"];
		};
	};
};
[] spawn DT_fnc_introCamera;

{
	(switch _forEachIndex do {
		case 0: {["level_woodcutting",false]};
		case 1: {["level_mining",2]};
		case 2: {["level_farming",false]};
		case 3: {["level_fishing",false]};
		case 4: {["level_hunting",false]};
	}) params ["_skill","_global"];
	for "_i" from 0 to 100 do {
		private _nextLevelExperience = getNumber(missionConfigFile >> "Skills" >> (format["Level_%1",_i])>> "experience");
		if (_x < _nextLevelExperience) exitWith {
			player setVariable [_skill,(_i - 1),_global];
		};
	};
} forEach [exp_woodcutting,exp_mining,exp_farming,exp_fishing,exp_hunting];

client_paycheck = switch (player getVariable ["doj_rank",0]) do {
	case 0: {0};
	case 1: {1000};
	case 2: {1500};
	case 3: {1500};
	case 4: {2000};
	case 5: {2500};
};