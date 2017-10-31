/*
	File: fn_seatbelt.sqf
	Author: DomT602 (domt602@gmail.com)
	Description: Simple script to switch seatbelt state
*/
//playSound "seatbelt"; need to find a sound
if(!life_seatbelt) then {
    life_seatbelt = true;
} else {
    life_seatbelt = false;
};