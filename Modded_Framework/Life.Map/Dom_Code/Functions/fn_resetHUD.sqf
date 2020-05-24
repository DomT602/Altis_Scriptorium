/*
	File: fn_resetHUD.sqf
	Author: Dom
	Description: Resets HUD - primarily after respawn
*/
private _HUD = uiNamespace getVariable ["DT_HUD",displayNull];

private _textArray = [1500,1501,1502,1503,1504,1507];
private _structuredTextArray = [1508,1509,1510,1511];

{
	(_HUD displayCtrl _x) ctrlSetText "";
} forEach _textArray;

{
	(_HUD displayCtrl _x) ctrlSetStructuredText parseText "";
} forEach _structuredTextArray;