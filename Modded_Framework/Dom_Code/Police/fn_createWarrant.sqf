/*
	File: fn_createWarrant.sqf
	Author: Dom
	Description: Starts writing up a warrant
*/
params [
	["_type","init",[""]]
];

if (_type isEqualTo "init") then {
	private _name = ctrlText 1400;
	createDialog "DT_addWarrant";
	private _display = findDisplay 1022;
	(_display displayCtrl 1403) ctrlSetText _name;
	(_display displayCtrl 1402) ctrlSetText profileName;
} else {
	private _display = findDisplay 1022;
	private _name = ctrlText 1403;
	if (_name isEqualTo "") exitWith {["You can't leave the name section blank.","red"] call DT_fnc_notify};
	private _crimes = ctrlText 1400;
	if (_crimes isEqualTo "") exitWith {["You can't leave the crimes section blank.","red"] call DT_fnc_notify};
	_crimes = (_crimes splitString "&") joinString "and";
	if !([_crimes] call DT_fnc_checkText) exitWith {};
	private _officer = ctrlText 1402;
	if (_officer isEqualTo "") exitWith {["You can't leave the issuing officers' name blank.","red"] call DT_fnc_notify};
	private _notes = ctrlText 1401;
	_notes = (_notes splitString "&") joinString "and";
	if !([_notes] call DT_fnc_checkText) exitWith {};
	private _arrest = cbChecked (_display displayCtrl 2800);
	private _search = cbChecked (_display displayCtrl 2801);
	if (_arrest && _search) exitWith {["You can only select arrest or search, not both.","orange"] call DT_fnc_notify};
	if (!_arrest && !_search) exitWith {["You need to select the warrant type.","orange"] call DT_fnc_notify};
	private _type = if (_arrest) then {1} else {0};
	closeDialog 0;
	[_name,_crimes,_officer,_notes,_type] remoteExecCall ["DB_fnc_insertWarrant",2];
};