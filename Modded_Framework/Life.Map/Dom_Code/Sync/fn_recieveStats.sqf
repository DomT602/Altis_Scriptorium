/*
	File: fn_requestReceived.sqf
	Author: Dom
	Description: Recieves clients information and sets it up
*/
params [
	["_dbID",-1,[0]],
	["_cash",0,[0]],
	["_bank",0,[0]],
	["_copLevel",0,[0]],
	["_medicLevel",0,[0]],
	["_dojLevel",0,[0]],
	["_licenses",[],[[]]],
	["_jailDetails",[],[[]]],
	["_gear",[],[[]]],
	["_stats",[],[[]]],
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
player setVariable ["cash",_cash,[clientOwner,2]];
player setVariable ["bank",_bank,[clientOwner,2]];
player setVariable ["copRank",_copLevel,true];
player setVariable ["medicRank",_medicLevel,true];
player setVariable ["dojRank",_dojLevel,true];

client_licenses = _licenses;
player setVariable ["jailStats",_jailDetails,true];

if (_gear isEqualTo []) then {
	call DT_fnc_defaultLoadout;
} else {
	player setUnitLoadout [_gear,false];
};

_stats params ["_hunger","_thirst","_battery","_blood","_injuries"];
player setVariable ["hunger",(_hunger max 11),true];
["hunger"] call DT_fnc_updateHUDPartial;
player setVariable ["thirst",(_thirst max 11),true];
["thirst"] call DT_fnc_updateHUDPartial;
player setVariable ["phoneBattery",_battery,[clientOwner,2]];
player setVariable ["blood",_blood,true];
["blood"] call DT_fnc_updateHUDPartial;
player setVariable ["injuries",_injuries,true];

player setVariable ["phoneNumber",_phoneNumber,true];
phone_contacts = _phoneContacts;
phone_settings = _phoneSettings;
if ([player] call TFAR_fnc_hasRadio) then {
	[call TFAR_fnc_ActiveSWRadio,(_phoneSettings select 2)] call TFAR_fnc_setSwVolume;
};

if !(_companyData isEqualTo []) then {
	_companyData params ["_name","_rank","_salary"];
	player setVariable ["companySalary",_salary,true];
	player setVariable ["company",_name,true];
	player setVariable ["companyRank",_rank,true];
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
player addEventHandler ["HandleDamage",{_this call DT_fnc_handleDamage}];
player addEventHandler ["FiredMan",{_this call DT_fnc_onFired}];
player addEventHandler ["InventoryClosed",{_this call DT_fnc_onInventoryClosed}];
player addEventHandler ["InventoryOpened",{_this call DT_fnc_onInventoryOpened}];
player addEventHandler ["Put",{_this call DT_fnc_onPutItem}];
player addEventHandler ["HandleRating",{0}];
player addEventHandler ["HandleScore",{false}];
player addEventHandler ["GetOutMan",{_this call DT_fnc_onGetOutMan}];
player addEventHandler ["Reloaded",{["reload",_this] call DT_fnc_updateHUDPartial}];
[missionNamespace,"OnGameInterrupt",{_this call DT_fnc_escManager}] call BIS_fnc_addScriptedEventHandler;
[missionNamespace,"arsenalOpened",{_this call DT_fnc_arsenalOpened}] call BIS_fnc_addScriptedEventHandler;
addMissionEventHandler ["Map",{_this call DT_fnc_checkMap}];
addMissionEventHandler ["Draw3D",{call DT_fnc_updateHUD}];
["weapon",{["weapon",_this] call DT_fnc_updateHUDPartial}] call CBA_fnc_addPlayerEventHandler;
["weaponMode",{["weaponMode",_this] call DT_fnc_updateHUDPartial}] call CBA_fnc_addPlayerEventHandler;

["cba_events_chatMessageSent", {
	params ["_message"];
	if (_message select [0,1] != "!") exitWith {};
	if (_message == "!upt") then {
		private _hours = floor(CBA_missionTime / 3600);
		private _minutes = floor((CBA_missionTime mod 3600) / 60);
		systemChat format["Server uptime: %1 hours %2 minutes.",_hours,_minutes];
	};
}] call CBA_fnc_addEventHandler;

for "_i" from 0 to (15 - 1) do {
	DT_notifArray pushBack ["",-1];
};

cutText ["","PLAIN",1];
658 cutRsc ["DT_HUD","PLAIN",-1,false];
659 cutRsc ["DT_Notifications","PLAIN"];

if (_jailDetails select 0) then {
	player setVehiclePosition [getMarkerPos "Jail_Spawn",[],0];
	call DT_fnc_jailTimer;
} else {
	if !(_position isEqualTo []) then {
		player setVehiclePosition [_position,[],0];
	} else {
		if (_houses isEqualTo []) then {
			player setVehiclePosition [getMarkerPos "Lakeside_Spawn",[],0];
		} else {
			private _house = selectRandom _houses;
			private _spawnPos = _house buildingPos 0;
			if (_spawnPos isEqualTo [0,0,0]) then {_spawnPos = getPosATL _house};
			player setVehiclePosition [_spawnPos,[],0];
		};
	};
};

if (_blood isEqualTo 0) then {[player] call DT_fnc_onPlayerKilled};
//call DT_fnc_TFARcheck;
call DT_fnc_medicalLoop;
call DT_fnc_survivalLoop;

{
	(switch _forEachIndex do {
		case 0: {["woodcutting",false]};
		case 1: {["mining",[clientOwner,2]]};
		case 2: {["farming",false]};
		case 3: {["fishing",false]};
		case 4: {["hunting",false]};
	}) params ["_skill","_global"];
	player setVariable [format["exp_%1",_skill],_x,[clientOwner,2]];
	for "_i" from 0 to 100 do {
		private _nextLevelExperience = getNumber(missionConfigFile >> "Skills" >> (format["Level_%1",_i])>> "experience");
		if (_x < _nextLevelExperience) exitWith {
			player setVariable [format["level_%1",_skill],(_i - 1),_global];
		};
	};
} forEach _skills;

client_paycheck = switch (player getVariable ["dojRank",0]) do {
	case 0: {0};
	case 1: {1000};
	case 2: {1500};
	case 3: {1500};
	case 4: {2000};
	case 5: {2500};
};
[] spawn DT_fnc_introCamera;