This folder contains the scripts needed for the full tracking system. This allows you to put GPS Trackers on players and vehicles, track them via the map (only when open for performance), and remove them.

Setup:
Download files from github
Put files into the desired folder
Add all files onto functions.hpp
In fn_setupEVH.sqf add: addMissionEventHandler ["Map",{_this call life_fnc_checkMap}];
In CfgRemoteExec add: F(life_fnc_removeTracker,CLIENT) (not implemented yet)
Add buttons to interaction menu's (one for playerGPS, one for vehicleGPS) e.g:
	_Btn3 ctrlSetText "GPS Tracker";
	_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_vehicleGPS; closeDialog 0;";
Decide how you want trackers to be removed e.g go to a NPC, use an item on it, not at all?