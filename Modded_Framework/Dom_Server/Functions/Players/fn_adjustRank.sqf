/*
	File: fn_adjustRank.sqf
	Author: Dom
	Description: Recieves request from client and updates DB accordingly
*/
params [
	["_uid","",[""]],
	["_faction","",[""]],
	["_rank",0,[0]],
	["_department",0,[0]]
];

if (_uid isEqualTo "" || {_faction isEqualTo ""}) exitWith {};

switch _faction do {
	case "cop": {[format["updateCopRank:%1:%2:%3",_rank,_department,_uid],1] call MySQL_fnc_DBasync};
	case "medic": {[format["updateMedicRank:%1:%2:%3",_rank,_department,_uid],1] call MySQL_fnc_DBasync};
	case "doj": {};
};