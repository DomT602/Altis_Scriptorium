/*
	File: fn_endCall.sqf
	Author: Dom
	Description: Ends the current call, and sets variables to default
*/
switch (player getVariable ["faction","civ"]) do {
	"civ": {[(call TFAR_fnc_activeSwRadio),1,getPlayerUID player] call TFAR_fnc_SetChannelFrequency; //just set number as UID as placeholder?};
	"cop": {["police"] call DT_fnc_govFreq};
	"medic": {["ems"] call DT_fnc_govFreq};	
};

phone_callingPlayer = false;
phone_beingCalled = false;
phone_callOwner = objNull;
phone_inCall = false;
phone_acceptedCall = false;
phone_hungupCall = false;
phone_denyedCall = false;
player setVariable ["callTotal",0,true];