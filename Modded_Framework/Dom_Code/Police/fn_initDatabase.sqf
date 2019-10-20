/*
	File: fn_initDatabase.sqf
	Author: Dom
	Description: Starts the main menu of the database
*/
if (player getVariable ["faction","civ"] != "cop" && ((player getVariable ["dojRank",0]) isEqualTo 0)) exitWith {};
createDialog "DT_policeDatabaseMain";
private _display = findDisplay 1018;

if !(PD_announcement isEqualTo "") then {
	(_display displayCtrl 1101) ctrlSetStructuredText parseText PD_announcement;
};

private _threat = switch threat_level do {
	case "Green": {format["<t color='#00CC00'>%1",threat_level]};
	case "Amber": {format["<t color='#FFBF00'>%1",threat_level]};
	case "Red": {format["<t color='#ff0000'>%1",threat_level]};
	case "Martial": {format["<t color='#8b0000'>%1 Law",threat_level]};
};
(_display displayCtrl 1100) ctrlSetStructuredText parseText _threat;

private _listbox = _display displayCtrl 1500;
{
	if (_x getVariable ["faction","civ"] isEqualTo "cop") then {
		_listbox lbAdd (name _x);
	};
} forEach playableUnits;