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
	private _randomNumber = str(100000 + round(random 899999));
	private _return = [format["checkNumber:%1",_randomNumber],2] call MySQL_fnc_DBasync;
	if (_return isEqualTo []) exitWith {_number = _randomNumber};
};

[format["insertPlayer:%1:%2:%3:%4",_uid,name _unit,_number,["\Dom_UI\phone\backgrounds\background1.paa","",8]],1] call MySQL_fnc_DBasync;
[
	{
		params ["_unit","_clientID"];
		[_unit,_clientID] call DB_fnc_initialStats;
	},
	[_unit,_clientID],
	0.3
] call CBA_fnc_waitAndExecute; //safeguard to ensure its entered