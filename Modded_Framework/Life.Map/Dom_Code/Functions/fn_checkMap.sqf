/*
	File: fn_checkMap.sqf
	Author: Dom
	Description: Checks if the map is being opened or closed, then puts markers according to side.
*/
params [
	["_mapOpen",false,[false]]
];
if (client_blockActions || !("ItemGPS" in assignedItems player)) exitWith {};

if (_mapOpen) then {
	call DT_fnc_trackedMarkers;
	switch (player getVariable ["faction","civ"]) do {
		case "cop": {call DT_fnc_policeMarkers};
		case "medic": {call DT_fnc_medicMarkers};
	};
};
