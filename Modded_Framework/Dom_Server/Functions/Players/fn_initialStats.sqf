/*
	File: fn_initialStats.sqf
	Author: Dom
	Description: Recieves request from client and sets their stuff up on connect
*/
params [
	["_unit",objNull,[objNull]],
	["_clientID",-1,[0]]
];
private _uid = getPlayerUID _unit;

if (_clientID isEqualTo -1) then {
	_clientID = remoteExecutedOwner;
};

private _return = [format["selectPlayer:%1",_uid],2] call MySQL_fnc_DBasync;
if (_return isEqualTo []) exitWith {[_uid,_unit,_clientID] call DB_fnc_insertPlayer};

private _companyData = [_uid] call DB_fnc_fetchCompany;
_return pushBack _companyData;

private _houseData = [_uid,_clientID] call DB_fnc_fetchBuildings;
_return pushBack _houseData;

private _keyArr = missionNamespace getVariable [format["keys_%1",_uid],[]];
_return pushBack _keyArr;

_return remoteExecCall ["DT_fnc_recieveStats",_unit];