/*
	File: fn_onGetInMan.sqf
	Author: Dom
	Description: Handles hopping in a vehicle
*/
params [
	"",
	"",
	["_vehicle",objNull,[objNull]]
];

if (car_warnSeatbelt) then {
	[
		{
			params ["_vehicle"];
			isNull objectParent player || 
			{speed _vehicle > 5}
		},
		{
			["Don't forget your seatbelt."] call DT_fnc_notify;
			//seatbelt noise
		},
		_vehicle
	] call CBA_fnc_waitUntilAndExecute;
};

if (typeOf client_carrying isEqualTo "Land_Sleeping_bag_blue_folded_F") then {
	[client_carrying,true] remoteExecCall ["hideObjectGlobal",2];
};