/*
	File: fn_saveStatsFull.sqf
	Author: Dom
	Description: Recieves request from client to update all values
*/

params [
	["_uid","",[""]],
	["_name","",[""]],
	["_faction","civ",[""]],
	["_cash",0,[0]],
	["_bank",20000,[0]],
	["_licenses",[],[[]]],
	["_gear",[],[[]]],
	["_jailDetails",[0,"",0,""],[[]]],
	["_stats",[100,100,100,5000,1,1,1,1],[[]]],
	["_phoneSettings",[],[[]]],
	["_phoneContacts",[],[[]]],
	["_skills",[],[[]]]
];
if (_uid isEqualTo "" || {_name isEqualTo ""}) exitWith {};

switch _faction do {
	case "cop": {[format["updateFullCop:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11",_name,_cash,_bank,_licenses,_gear,_jailDetails,_stats,_phoneContacts,_phoneSettings,_skills,_uid],1] call MySQL_fnc_DBasync};
	case "civ": {[format["updateFullCiv:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11",_name,_cash,_bank,_licenses,_gear,_jailDetails,_stats,_phoneContacts,_phoneSettings,_skills,_uid],1] call MySQL_fnc_DBasync};
	case "medic": {[format["updateFullMedic:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11",_name,_cash,_bank,_licenses,_gear,_jailDetails,_stats,_phoneContacts,_phoneSettings,_skills,_uid],1] call MySQL_fnc_DBasync};
};