/*
	File: fn_showID.sqf
	Author: Dom
	Description: Shows the ID of the sender
*/
params [
	["_data",objNull,[objNull,[]]]
];

private _name = "";
private _text = "";
private _company = "";

if (_data isEqualType objNull) then {
	_name = profileName;
	_company = player getVariable ["company",""];
	private _faction = _data getVariable ["faction","civ"];

	private _rank = switch _faction do {
		case "civ": {player getVariable ["dojRank",0]};
		case "cop": {player getVariable ["copRank",0]};
		case "medic": {player getVariable ["medicRank",0]};
	};

	_text = if (_faction isEqualTo "civ" && {_rank isEqualTo 0}) then {
		"Resident";
	} else {
		[_faction,_rank,(_data getVariable ["department",0])] call DT_fnc_rankName;
	};
} else {
	(profileNamespace getVariable ["DT_fakeID",[]]) params ["_fakeName","_fakeOccupation","_fakeCompany"];
	_name = _fakeName;
	_text = _fakeOccupation;
	_company = _fakeCompany;
};

private _fnc_showDetails = {
	params ["_name","_text","_company"];
	655 cutRsc ["DT_ID","PLAIN"];
	private _display = uiNamespace getVariable ["DT_ID",displayNull];
	(_display displayCtrl 1100) ctrlSetText format ["Name: %1",_name];
	(_display displayCtrl 1101) ctrlSetText format ["Occupation: %1",_text];
	if (_company != "") then {_company = format ["Company: %1",_company]};
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