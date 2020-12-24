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
private _gear = getUnitLoadout _unit;
private _stats = [_unit getVariable ["hunger",100],_unit getVariable ["thirst",100],_unit getVariable ["phoneBattery",100],_unit getVariable ["blood",5000],_unit getVariable ["injuries",[]]];
if (_unit getVariable ["dead",false]) then {
	[[_uid,_name],"Combat Logged"] call server_fnc_logAction;
	_position = [];
	_gear = [];
	_stats = [100,100,100,5000,[0,0,0,0,0,0]];
};

if (_unit getVariable ["restrained",false] || _unit getVariable ["tied",false]) then {
	[[_uid,_name],"Logged while restrained/tied"] call server_fnc_logAction;
};

private _jailDetails = _unit getVariable ["jailStats",[false,"",0,""]];
if (_jailDetails select 0) then {
	private _cellRef = _jailDetails select 3;
	jail_cellsUsed deleteAt (jail_cellsUsed find _cellRef);
	publicVariable jail_cellsUsed;
};
private _side = _unit getVariable ["faction",""];
private _cash = _unit getVariable ["cash",0];
private _bank = _unit getVariable ["bank",0];
private _exp = [_unit getVariable ["exp_woodcutting",0],_unit getVariable ["exp_mining",0],_unit getVariable ["exp_farming",0],_unit getVariable ["exp_fishing",0],_unit getVariable ["exp_hunting",0]];
deleteVehicle _unit;
if (_side isEqualTo "") exitWith {};

[format["%1Disconnect:%2:%3:%4:%5:%6:%7:%8:%9:%10",_side,_position,_gear,_name,_stats,_cash,_bank,_exp,_jailDetails,_uid],1] call MySQL_fnc_DBasync;
