/*
	File: fn_showID.sqf
	Author: Dom
	Description: Shows the ID of the sender
*/
params [
	["_unit",objNull,[objNull]]
];

private _name = name _unit;
private _faction = _unit getVariable ["faction","civ"];

private _rank = switch _faction do {
	case "civ": {player getVariable ["dojRank",0]};
	case "cop": {player getVariable ["copRank",0]};
	case "cop": {player getVariable ["medicRank",0]};
};

private _text = if (_faction isEqualTo "civ" && {_rank isEqualTo 0}) then {
	"Resident";
} else {
	[_faction,_rank,(_unit getVariable ["department",0])] call DT_fnc_rankName;
};
private _company = _unit getVariable ["company",""];

private _fnc_showDetails = {
	params ["_name","_text","_company"];
	655 cutRsc ["DT_ID","PLAIN"];
	private _display = uiNamespace getVariable ["DT_ID",displayNull];
	(_display displayCtrl 1100) ctrlSetText _name;
	(_display displayCtrl 1101) ctrlSetText _text;
	(_display displayCtrl 1102) ctrlSetText _company;
	[
		{
			655 cutText ["","PLAIN"];
		},
		0,
		5
	] call CBA_fnc_waitAndExecute;
};

private _display = uiNamespace getVariable ["DT_ID",displayNull];
if (isNull _display) then {
	[_name,_text,_company] call _fnc_showDetails;
} else {
	[
		{
			isNull (uiNamespace getVariable ["DT_ID",displayNull])
		},
		{
			(_this select 0) call (_this select 1)
		},
		[[_name,_text,_company],_fnc_showDetails]
	] call CBA_fnc_waitUntilAndExecute;
};