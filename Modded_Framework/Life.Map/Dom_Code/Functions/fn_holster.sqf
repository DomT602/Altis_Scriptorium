/*
	File: fn_holster.sqf
	Author: Dom
	Description: Switches the state of players holster
*/

if !(currentWeapon player isEqualTo "") then {
	client_holster = currentWeapon player;
	player action ["SwitchWeapon", player, player, 100];
} else {
	if !(client_holster isEqualTo "") then {
		player selectWeapon client_holster;
	};
};
true