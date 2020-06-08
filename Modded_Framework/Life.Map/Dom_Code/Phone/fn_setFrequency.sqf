/*
	File: fn_setFrequency.sqf
	Author: Dom
	Description: Changes phone onto the correct frequency
*/
params [
	["_freq","",[""]],
	["_index",1,[0]]
];
if (_freq isEqualTo "") exitWith {};

private _radio = call TFAR_fnc_activeSwRadio;
[_radio,_index,_freq] call TFAR_fnc_setChannelFrequency;
if (_index isEqualTo 1) then {
	[_radio,primary_radioStereo] call TFAR_fnc_setSwStereo;
	[_radio,0] call TFAR_fnc_setSwChannel;
} else {
	[_radio,dispatch_radioStereo] call TFAR_fnc_setAdditionalSwStereo;
	[_radio,1] call TFAR_fnc_setAdditionalSwChannel;
};

[
	{
		[
			{
				player getVariable ["dead",false] || !phone_inCall || isNull phone_callOwner || (phone_callOwner getVariable ["callTotal",0] < 2)
			},
			{
				if (phone_inCall) then {
					["Call ended."] call DT_fnc_notify;
					if (phone_callOwner != player) then {
						["callerHungup"] remoteExecCall ["DT_fnc_phoneStateChanged",phone_callOwner];
					};
					call DT_fnc_endCall;
				};
			}
		] call CBA_fnc_waitUntilAndExecute;
	},
	0,
	0.25
] call CBA_fnc_waitAndExecute;