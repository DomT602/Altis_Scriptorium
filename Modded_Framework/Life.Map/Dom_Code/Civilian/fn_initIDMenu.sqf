/*
	File: fn_initIDMenu.sqf
	Author: Dom
	Description: Starts the menu for fake ID creation
*/
params [
	["_target",objNull,[objNull]]
];

createDialog "DT_createID";
private _oldID = profileNamespace getVariable ["DT_fakeID",[]];
private _display = findDisplay 1050;
if (_oldID isEqualTo []) then {
	(_display displayCtrl 1400) ctrlSetText profileName;
} else {
	_oldID params ["_name","_occupation","_company"];
	(_display displayCtrl 1400) ctrlSetText _name;
	(_display displayCtrl 1401) ctrlSetText _occupation;
	(_display displayCtrl 1402) ctrlSetText _company;
};