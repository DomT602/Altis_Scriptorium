/*
	File: fn_initialStats.sqf
	Author: Dom
	Description: Recieves request from client and sets their stuff up on connect
*/
params [
    ["_uid","",[""]],
    ["_unit",objNull,[objNull]]
];

private _return = [format["selectPlayer:%1",_uid],2] call MySQL_fnc_DBasync;

if (_return isEqualTo []) exitWith {[_uid,_unit] call DB_fnc_insertPlayer};

private _companyData = [_uid] call DB_fnc_fetchCompany; //company data - returns either [] or [filled,with,data];
_return pushBack _companyData;

private _houseData = [_uid] call DB_fnc_fetchBuildings;
_return pushBack _houseData;

private _keyArr = missionNamespace getVariable [format["keys_%1",_uid],[]];
_return pushBack _keyArr;

_return remoteExecCall ["DT_fnc_recieveStats",_unit];