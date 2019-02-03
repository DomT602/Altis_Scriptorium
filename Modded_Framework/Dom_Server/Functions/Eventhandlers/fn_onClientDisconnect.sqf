/*
    File: fn_onClientDisconnect.sqf
    Author: Dom
    Description: Syncs position on client disconnect
*/
params [
    ["_unit",objNull,[objNull]],
    "",
    ["_uid","",[""]]
];

private _position = getPosATL _unit;
private _alive = if (_unit getVariable ["dead",false]) then {0} else {1};
if (_alive isEqualTo 0) then {
	[[_uid,name _unit],"Combat Logged",true] call server_fnc_logAction;
};
if (_unit getVariable ["restrained",false] || _unit getVariable ["tied",false]) then {
	[[_uid,name _unit],"Logged while restrained/tied",true] call server_fnc_logAction;
};
if ((_unit getVariable ["jail_details",[0,"",0,""]] select 0) isEqualTo 1) then {
	[_uid,"civ",3,_unit getVariable ["jail_details",[]]] call DB_fnc_saveStatsPartial;
};

deleteVehicle _unit;
[format["clientDisconnect:%1:%2:%3",_alive,_position,_uid],1] call MySQL_fnc_DBasync;