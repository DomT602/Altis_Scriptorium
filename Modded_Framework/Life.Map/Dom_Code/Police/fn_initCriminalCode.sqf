/*
	File: fn_initCriminalCode.sqf
	Author: Dom
	Description: Populates the criminal code
*/

createDialog "DT_criminalCode";
private _display = findDisplay 1043;
private _tree = _display displayCtrl 1500;
_tree tvAdd [[],"Felonies"];
_tree tvAdd [[],"Misdemeanors"];
_tree tvAdd [[],"Infractions"];
_tree tvAdd [[],"Definitions"];

private _baseCfg = missionConfigFile >> "Misc" >> "CriminalCode";
private _array = [getArray(_baseCfg >> "felonies"),getArray(_baseCfg >> "misdemeanors"),getArray(_baseCfg >> "infractions"),getArray(_baseCfg >> "definitions")];

{
	private _index = _forEachIndex;
	{
		_x params ["_title","_penalty","_details"];
		_tree tvAdd [[_index],_title];
		private _count = (_tree tvCount [_index]) - 1;
		_tree tvSetData [[_index,_count],str([_penalty,_details])];
	} forEach _x;
} forEach _array;