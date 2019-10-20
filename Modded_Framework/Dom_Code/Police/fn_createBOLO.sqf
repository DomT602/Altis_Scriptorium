/*
	File: fn_createBOLO.sqf
	Author: Dom
	Description: Creates a BOLO
*/

private _display = findDisplay 1024;
private _person = cbChecked (_display displayCtrl 2800);
private _vehicle = cbChecked (_display displayCtrl 2801);
if (_person && _vehicle) exitWith {["You can only select vehicle or person, not both.","orange"] call DT_fnc_notify};
if (!_person && !_vehicle) exitWith {["You need to select the BOLO type.","orange"] call DT_fnc_notify};

private _notes = ctrlText 1400;
private _plateOrName = ctrlText 1403;
private _officer = ctrlText 1402;
if (_notes isEqualTo "") exitWith {["The notes field cannot be left blank.","red"] call DT_fnc_notify};
if (_plateOrName isEqualTo "") exitWith {["The name/plate field cannot be left blank, put UNKNOWN if not known.","red"] call DT_fnc_notify};
private _toAdd = [_plateOrName,_notes,_officer];
if (_vehicle) then {
	PD_vehBOLOs pushBack _toAdd;
	publicVariable "PD_vehBOLOs";
} else {
	PD_otherBOLOs pushBack _toAdd;
	publicVariable "PD_otherBOLOs";
};
closeDialog 0;