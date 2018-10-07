/*
	File: fn_closeShop.sqf
	Author: Dom
	Description: Closes a shop menu
*/
params [
	["_type","",[""]]
];

removeMissionEventHandler ["draw3D",preview_handle];
client_camera cameraEffect ["Terminate","Back"];
camDestroy client_camera;
deleteVehicle client_preview;
deleteVehicle client_target;
client_mouseButtons = [[],[]];
client_cameraSettings = [5,0,0,[0,0,0.85]];