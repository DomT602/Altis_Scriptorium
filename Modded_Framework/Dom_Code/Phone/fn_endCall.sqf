/*
	File: fn_endCall.sqf
	Author: Dom
	Description: Ends the current call, and sets variables to default
*/

phone_callOwner = objNull;
phone_beingCalled = false;
phone_targetNumber = "";
phone_inCall = false;
phone_callingPlayer = false;
player setVariable ["callTotal",0,true];
if (phone_incNumber isEqualTo "911") then {
	[call TFAR_fnc_activeSwRadio,1] call TFAR_fnc_setAdditionalSwChannel;
} else {
	switch (player getVariable ["faction","civ"]) do {
		case "civ": {[call TFAR_fnc_activeSwRadio,1,getPlayerUID player] call TFAR_fnc_SetChannelFrequency};
		case "cop": {["cop"] call DT_fnc_govFreq};
		case "medic": {["medic"] call DT_fnc_govFreq};	
	};
};
phone_incNumber = "";