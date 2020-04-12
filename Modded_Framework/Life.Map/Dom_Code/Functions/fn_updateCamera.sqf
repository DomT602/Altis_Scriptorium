/*
	File: fn_updateCamera.sqf
	Author: Karel Moricky - Edited by Dom
	Description: Updates camera position and details
*/

client_cameraSettings params ["_dis","_dirH","_dirV"];

[client_target,[_dirH + 180,-_dirV,0]] call bis_fnc_setobjectrotation;
client_target attachTo [client_preview,client_cameraSettings select 3,""]; //--- Reattach for smooth movement

client_camera setPos (client_target modelToWorld [0,-_dis,0]);
client_camera setVectorDirAndUp [vectorDir client_target,vectorUp client_target];

if ((getPos client_camera select 2) < (getPos client_preview select 2)) then {
	private _disCoef = ((getPos client_preview select 2) - (getPos client_preview select 2)) / ((getPos client_preview select 2) - (getPos client_camera select 2) + 0.001);
	client_camera setPos (client_preview modelToWorldVisual [0,-_dis * _disCoef,0]);
};