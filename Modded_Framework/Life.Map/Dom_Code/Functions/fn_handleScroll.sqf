/*
	File: fn_handleScroll.sqf
	Author: Karel Moricky - Edited by Dom
	Description: Handles scroll wheel
*/
params [
	["_ctrl",controlNull,[controlNull]],
	["_zPos",0,[0]]
];

private _distanceMax = ((boundingBoxReal client_preview select 0) vectorDistance (boundingBoxReal client_preview select 1)) * 1.5;
private _distanceMin = _distanceMax * 0.15;
client_cameraSettings params ["_distance"];

private _distance = (_distance - (_zPos / 10)) max _distanceMin min _distanceMax;
client_cameraSettings set [0, _distance];