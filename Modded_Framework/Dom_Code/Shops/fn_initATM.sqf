/*
	File: fn_initATM.sqf
	Author: Dom
	Description: Initiliases ATM or mobile banking
*/
params [
	["_phone",false,[false]]
];

private _idd = 1030;
if (_phone) then {
	createDialog "DT_phoneBanking";
	_idd = 1038;
	[phone_appOpen] call DT_fnc_updatePhone;
} else {
	createDialog "DT_banking";
};

private _display = findDisplay _idd;

if (player getVariable ["company",""] != "") then {
	(_display displayCtrl 1102) ctrlSetStructuredText parseText "Fetching company funds...";
	[player getVariable ["company",""],6] remoteExecCall ["DB_fnc_updateCompany",2];
};

private _units = _display displayCtrl 2100;
{
	_units lbAdd (name _x);
	_units lbSetData [_forEachIndex,getPlayerUID _x];
} forEach (playableUnits - [player]);
_units lbSetCurSel 0;