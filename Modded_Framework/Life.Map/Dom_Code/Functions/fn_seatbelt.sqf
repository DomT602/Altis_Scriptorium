/*
	File: fn_seatbelt.sqf
	Author: Dom
	Description: Simply puts on/takes off a seatbelt
*/
if !(isNull objectParent player) then {
	//playSound "seatbelt"; need to find a sound
	if !(client_seatbelt) then {
		client_seatbelt = true;
	} else {
		client_seatbelt = false;
	};
};
["seatbelt"] call DT_fnc_updateHUDPartial;
true;