/*
	File: fn_recieveProfile.sqf
	Author: Dom
	Description: Recieves profile from server and displays info
*/
params [
	["_arrests",[],[[]]],
	["_tickets",[],[[]]],
	["_warrants",[],[[]]],
	["_licenseData",[],[[]]]
];

private _display = findDisplay 1017;
private _tree = _display displayCtrl 1500;
tvClear _tree;
_tree tvAdd [[],"Arrests"];
_tree tvAdd [[],"Citations"];
_tree tvAdd [[],"Warrants"];
_tree tvAdd [[],"Licenses"];

{
	_x params ["_name","_crimes","_officer","_time","_bail","_notes","_insertTime"];
	private _brief = format["%1 - %2 - %3",_insertTime,_time,_name];
	_tree tvAdd [[0],_brief];
	_tree tvSetData [[0,_forEachIndex],str(_x)];
} forEach _arrests;

{
	_x params ["_name","_crimes","_officer","_cost","_insertTime"];
	private _brief = format["%1 - %2 - %3",_insertTime,_cost,_name];
	_tree tvAdd [[1],_brief];
	_tree tvSetData [[1,_forEachIndex],str(_x)];
} forEach _tickets;

{
	_x params ["_id","_name","_crimes","_officer","_notes","_type","_approved","_active","_completedBy","_insertTime"];
	if (_approved isEqualTo "") then {_x set [6,"Unapproved"]};
	if (_active isEqualTo 1) then {
		_active = "Active"; 
		_tree tvSetColor [[2],[1,0,0,1]];
		_tree tvSetColor [[2,_forEachIndex],[1,0,0,1]]
	} else {
		_active = "Completed"
	};
	_x set [7,_active];
	_type = if (_type isEqualTo 1) then {"Arrest"} else {"Search"};
	_x set [5,_type];
	private _brief = format["%1 - %2 - %3 - %4",_insertTime,_active,_type,_name];
	_tree tvAdd [[2],_brief];
	_tree tvSetData [[2,_forEachIndex],str(_x)];
} forEach _warrants;

{
	_x params ["_name","_licenses"];
	{
		private _licName = getText(missionConfigFile >> "Licenses" >> _x >> "displayName");
		_tree tvAdd [[3],format["%1 - %2",_name,_licName]];
	} forEach _licenses;
} forEach _licenseData;