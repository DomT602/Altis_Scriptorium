/*
	File: fn_createID.sqf
	Author: Dom
	Description: Creates/updates the players fake ID
*/
private _display = findDisplay 1050;
private _name = ctrlText (_display displayCtrl 1400);
private _occupation = ctrlText (_display displayCtrl 1401);
private _company = ctrlText (_display displayCtrl 1402);
private _cost = 500;

if (_name isEqualTo "" || {_occupation isEqualTo ""}) exitWith {["The name and occupation must be filled in.","orange"] call DT_fnc_notify};
if (count _name > 50) exitWith {["The name is too long.","orange"] call DT_fnc_notify};
if (count _occupation > 50) exitWith {["The occupation name is too long.","orange"] call DT_fnc_notify};
if (count _company > 50) exitWith {["The company name is too long.","orange"] call DT_fnc_notify};

private _action = [
	format["It will cost $%1 for this fake ID to be created.",_cost],
	"Fake ID Creation",
	"Create",
	"Cancel"
] call BIS_fnc_guiMessage;

closeDialog 0;
if (_action) then {
	if (_cost > player getVariable ["cash",0]) exitWith {["You don't have enough money.","orange"] call DT_fnc_notify};
	["cash",-_price] call DT_fnc_handleMoney;
	profileNamespace setVariable ["DT_fakeID",[_name,_occupation,_company]];
	["Fake ID created.","green"] call DT_fnc_notify;
};