/*
	File: fn_insertPlayer.sqf
	Author: Dom
	Description: Recieves request from client and inserts data to DB
*/
params [
    ["_uid","",[""]],
    ["_unit",objNull,[objNull]],
    ["_clientID",-1,[0]]
];

if (_uid isEqualTo "" || {isNull _unit}) exitWith {};

private "_number";
for "_i" from 0 to 1 step 0 do {
	private _randomNumber = str(100000 + round(random 99999));
	private _return = [format["checkNumber:%1",_randomNumber],2] call MySQL_fnc_DBasync;
	if (_return isEqualTo []) exitWith {_number = _randomNumber};
};

[format["insertPlayer:%1:%2:%3",_uid,name _unit,_number],1] call MySQL_fnc_DBasync;
[_uid,_unit,_clientID] call DB_fnc_initialStats;