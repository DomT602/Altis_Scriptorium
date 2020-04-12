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
if (_type in ["mod","none"]) then {
	if (_type isEqualTo "mod" && {!isNull MB_Interaction_Target}) then {
		[MB_Interaction_Target,(MB_Interaction_Target getVariable ["customisation",[]]),true] call DT_fnc_setCustomisation;
	};
} else {
	deleteVehicle client_preview;
};
deleteVehicle client_target;
client_mouseButtons = [[],[]];
client_cameraSettings = [5,0,0,[0,0,0.85]];

if (_type isEqualTo "Item") then {
	private _vendor = uiNamespace getVariable ["vendor",objNull];
	if (typeOf _vendor != "C_man_1_2_F") exitWith {};
	private _oldFunds = _vendor getVariable ["funds",0];
	private _myFunds = uiNamespace getVariable ["funds",0];
	if (_myFunds isEqualTo 0) exitWith {};
	_vendor setVariable ["funds",(_oldFunds + _myFunds) max 0,true];
};