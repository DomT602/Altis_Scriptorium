/*
	File: fn_createCompany.sqf
	Author: Dom
	Description: Creates the company with filled in details
*/
private _name = ctrlText 1400;
private _description = ctrlText 1401;

if (count _name > 48) exitWith {["The company name is too long.","orange"] call DT_fnc_notify};
if (count _description > 256) exitWith {["The company description is too long.","orange"] call DT_fnc_notify};

if (!([_name] call DT_fnc_checkText) || {!([_description] call DT_fnc_checkText)}) exitWith {};

if ((player getVariable ["cash",0]) < 25000) exitWith {["You need $25000 to start a new company.","orange"] call DT_fnc_notify};

private _index = company_list findIf {_x select 0 == _name};
if (_index != -1) exitWith {["You can't have the same name as another company.","orange"] call DT_fnc_notify};
closeDialog 0;
[getPlayerUID player,_name,_description] remoteExecCall ["DB_fnc_insertCompany",2];