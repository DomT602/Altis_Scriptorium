/*
	File: fn_initWarrants.sqf
	Author: Dom
	Description: Starts the warrants/BOLO's part of the database
*/

createDialog "DT_viewWarrants";
private _display = findDisplay 1019;
private _tree = _display displayCtrl 1500;
tvClear _tree;

_tree tvAdd [[],"Search Warrants"];
_tree tvAdd [[],"Arrest Warrants"];
_tree tvAdd [[],"Vehicle BOLO's"];
_tree tvAdd [[],"Other BOLO's"];

private _warrants = +warrant_list;
{
	_x params ["_id","_name","_crimes","_officer","_notes","_type","_approved","_insertTime"];
	private _index = _type;
	_approved = if (_approved isEqualTo "") then {"Unapproved"};
	_type = if (_type isEqualTo 1) then {"Arrest"} else {"Search"};
	_x set [5,_type];
	private _brief = format["%1 - %2",_insertTime,_name];
	_tree tvAdd [[_index],_brief];
	_tree tvSetData [[_index,(_tree tvCount [_index])-1],str(_x)];
} forEach _warrants;

{
	_x params ["_plate","_notes","_officer"];
	private _brief = format["%1 - %2",_plate,_officer];
	_tree tvAdd [[2],_brief];
	_tree tvSetData [[2,_forEachIndex],str(_x)];
} forEach PD_vehBOLOs;

{
	_x params ["_name","_notes","_officer"];
	private _brief = format["%1 - %2",_name,_officer];
	_tree tvAdd [[3],_brief];
	_tree tvSetData [[3,_forEachIndex],str(_x)];
} forEach PD_otherBOLOs;