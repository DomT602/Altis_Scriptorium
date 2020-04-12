/*
	File: fn_placeItem.sqf
	Author: Dom
	Description: Places the item which is currently being held
*/

if (isNull client_carrying) exitWith {["You're not holding anything."] call DT_fnc_notify};

if (typeOf client_carrying isEqualTo "MW_spikeStrip") then {
	detach client_carrying;
	[client_carrying] remoteExecCall ["server_fnc_monitorSpikes",2];
} else {
	{
		detach _x;
	} forEach (client_carrying getVariable ["components",[]]);
};

client_carrying = objNull;