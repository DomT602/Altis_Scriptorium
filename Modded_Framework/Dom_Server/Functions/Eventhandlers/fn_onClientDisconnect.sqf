/*
	File: fn_onClientDisconnect.sqf
	Author: Dom
	Description: Syncs player details on client disconnect
*/
params [
	["_unit",objNull,[objNull]],
	"",
	["_uid","",[""]],
	["_name","",[""]]
];

private _position = getPosATL _unit;
if (_unit getVariable ["dead",false]) then {
	[[_uid,_name],"Combat Logged"] call server_fnc_logAction;
	_position = [];
};

if (_unit getVariable ["restrained",false] || _unit getVariable ["tied",false]) then {
    [[_uid,_name],"Logged while restrained/tied"] call server_fnc_logAction;
};

private _jailDetails = _unit getVariable ["jailStats",[false,"",0,""]];
private _side = _unit getVariable ["faction",""];
private _cash = _unit getVariable ["cash",0];
private _bank = _unit getVariable ["bank",0];
private _exp = [_unit getVariable ["exp_woodcutting",0],_unit getVariable ["exp_mining",0],_unit getVariable ["exp_farming",0],_unit getVariable ["exp_fishing",0],_unit getVariable ["exp_hunting",0]];
deleteVehicle _unit;
if (_side isEqualTo "") exitWith {};

[format["%1Disconnect:%2:%3:%4:%5:%6:%7:%8:%9:%10",_side,_position,_gear,_name,_stats,_cash,_bank,_exp,_jailDetails,_uid],1] call MySQL_fnc_DBasync;