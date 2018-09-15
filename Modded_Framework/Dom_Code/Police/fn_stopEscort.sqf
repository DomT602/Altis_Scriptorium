/*
    File: fn_stopEscort.sqf
    Author: Dom
    Description: Stops escorting any attached players
*/

{
	if (_x isKindOf "Man") then {
		detach _x;
	};
} forEach attachedObjects player;

client_carrying = objNull;