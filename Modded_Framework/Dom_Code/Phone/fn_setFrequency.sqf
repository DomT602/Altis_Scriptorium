/*
	File: fn_setFrequency.sqf
	Author: Dom
	Description: Changes phone onto the correct frequency
*/
params [
	["_freq","",[""]]
];
if (_freq isEqualTo "") exitWith {};

[(call TFAR_fnc_activeSwRadio),1,_freq] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio),0] call TFAR_fnc_setSwChannel;

[
	{
		player getVariable ["dead",false] || !phone_inCall || isNull phone_callOwner || (phone_callOwner getVariable ["callTotal",0] < 2)
	},
	{
		if (phone_inCall) then {
			call DT_fnc_endCall;
		};
	}
] call CBA_fnc_waitUntilAndExecute;