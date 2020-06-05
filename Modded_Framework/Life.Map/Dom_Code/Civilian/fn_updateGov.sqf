/*
	File: fn_updateGov.sqf
	Author: Dom
	Description: Update an element of the government menu (only usable by mayor)
	To-do: Make GUI which has 3 text boxes for taxes, needs onLoad = onLoad="(_this select 0) ctrlSetText str(gov_taxArray select 0)"; etc
	Populate _idcArray once GUI made, should have 3 entries for each textbox
*/
params [
	["_option","",[""]]
];

if (_option isEqualTo "taxes") then {
	private _taxArray = [];
	private _idcArray = [];
	{
		private _percentage = parseNumber (ctrlText _x);
		if (_percentage < 0 || {_percentage > 100}) exitWith {["Invalid percentage entered.","red"] call DT_fnc_notify};
		_taxArray pushBack _percentage;
	} forEach _idcArray;
	if (count _taxArray != 3) exitWith {};
	[_option,_taxArray] remoteExecCall ["server_fnc_updateGovData",2];
	["Tax updated.","green"] call DT_fnc_notify;
};
