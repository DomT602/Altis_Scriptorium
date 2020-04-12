/*
	File: fn_stopEscort.sqf
	Author: Dom
	Description: Stops escorting any attached players (just detaches what your carrying)
*/

detach client_carrying;
client_carrying = objNull;